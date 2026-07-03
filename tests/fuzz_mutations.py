#!/usr/bin/env python3
"""Corrupt known-correct proofs and check the verifier never blesses the
corruption. HARD mutations are guaranteed-invalidating and asserted; SOFT
mutations can leave a proof logically valid, so they are only reported.

Usage: python3 tests/fuzz_mutations.py [--seed N]
"""
import os, random, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, ROOT)
import proover
from proover import (Step, pp, Func, Var, Atom, Not, func_symbols)

CLI = os.path.join(ROOT, "proover-check")
EXAMPLES = os.path.join(HERE, "examples")

BASES = [
    (f"{EXAMPLES}/correct/Problems/COR001+1.p", f"{EXAMPLES}/correct/COR001+1.s"),
    (f"{EXAMPLES}/correct/Problems/COR002+1.p", f"{EXAMPLES}/correct/COR002+1.s"),
    (f"{EXAMPLES}/correct/Problems/COR003+1.p", f"{EXAMPLES}/correct/COR003+1.s"),
]


def emit(steps):
    out = []
    for s in steps:
        if s.source_kind == 'file':
            src = f", file('problem.p', {s.file_ref or s.name})"
        elif s.source_kind == 'inference':
            src = (f", inference({s.rule}, [{s.annots}], "
                   f"[{', '.join(s.premises)}])")
        elif s.source_kind == 'copy':
            src = f", {s.file_ref}"
        else:
            src = ""
        out.append(f"fof({s.name}, {s.role}, {pp(s.formula)}{src}).")
    return "\n".join(out) + "\n"


def rename_symbol(f, old, new):
    def t(x):
        if isinstance(x, Func):
            return Func(new if x.name == old else x.name,
                        tuple(t(a) for a in x.args))
        return x
    def go(g):
        if isinstance(g, Atom): return Atom(g.pred, tuple(t(a) for a in g.args))
        if isinstance(g, proover.Eq): return proover.Eq(t(g.lhs), t(g.rhs))
        if isinstance(g, Not): return Not(go(g.sub))
        if isinstance(g, (proover.And, proover.Or, proover.Implies, proover.Iff)):
            return type(g)(go(g.l), go(g.r))
        if isinstance(g, (proover.Forall, proover.Exists)):
            return type(g)(g.var, go(g.body))
        return g
    return go(f)


def corrupt_leaf(steps, rng):
    """Tamper with an input formula in-vocabulary. Renaming to a fresh symbol
    would be a conservative extension (still sound), so swap one existing
    symbol for another, or negate the leaf if there is nothing to swap."""
    leaves = [i for i, s in enumerate(steps) if s.source_kind == 'file']
    if not leaves:
        return None
    i = rng.choice(leaves)
    s = steps[i]
    vocab = sorted(set().union(*[func_symbols(x.formula) for x in steps]))
    syms = sorted(func_symbols(s.formula))
    others = [x for x in vocab if syms and x != syms[0]]
    if syms and others:
        new = rng.choice(others)
        steps[i] = Step(s.name, s.role, rename_symbol(s.formula, syms[0], new),
                        s.source_kind, s.file_ref, s.rule, s.status,
                        s.premises, s.annots)
        return f"corrupt leaf {s.name} ({syms[0]} -> {new})"
    steps[i] = Step(s.name, s.role, proover.negate(s.formula),
                    s.source_kind, s.file_ref, s.rule, s.status,
                    s.premises, s.annots)
    return f"negate leaf {s.name}"

def orphan_negation(steps, rng):
    "Turn the negated_conjecture into a bare input, i.e. a fabricated axiom."
    for i, s in enumerate(steps):
        if s.rule == 'negated_conjecture':
            steps[i] = Step(s.name, 'axiom', s.formula)
            return f"orphan negated_conjecture {s.name}"
    return None

def forward_premise(steps, rng):
    "Point an inference at a step defined after it."
    infs = [i for i, s in enumerate(steps)
            if s.source_kind == 'inference' and s.premises and i + 1 < len(steps)]
    if not infs:
        return None
    i = rng.choice(infs)
    s = steps[i]
    steps[i] = Step(s.name, s.role, s.formula, s.source_kind, s.file_ref,
                    s.rule, s.status, [steps[-1].name if i < len(steps) - 1
                                       else s.premises[0]] + s.premises[1:],
                    s.annots)
    return f"forward premise on {s.name}"

HARD = [corrupt_leaf, orphan_negation, forward_premise]


def negate_step(steps, rng):
    infs = [i for i, s in enumerate(steps) if s.source_kind == 'inference']
    if not infs:
        return None
    i = rng.choice(infs)
    s = steps[i]
    steps[i] = Step(s.name, s.role, proover.negate(s.formula), s.source_kind,
                    s.file_ref, s.rule, s.status, s.premises, s.annots)
    return f"negate step {s.name}"

def drop_premise(steps, rng):
    infs = [i for i, s in enumerate(steps)
            if s.source_kind == 'inference' and len(s.premises) > 1]
    if not infs:
        return None
    i = rng.choice(infs)
    s = steps[i]
    steps[i] = Step(s.name, s.role, s.formula, s.source_kind, s.file_ref,
                    s.rule, s.status, s.premises[:-1], s.annots)
    return f"drop premise of {s.name}"

SOFT = [negate_step, drop_premise]


def run_cli(problem, proof_text):
    with tempfile.NamedTemporaryFile("w", suffix=".s", delete=False) as f:
        f.write(proof_text)
        path = f.name
    try:
        out = subprocess.run([sys.executable, CLI, "--quiet", problem, path],
                             capture_output=True, text=True, timeout=45).stdout
    finally:
        os.unlink(path)
    for line in out.splitlines():
        if line.startswith("% SZS status "):
            return line[len("% SZS status "):].split(" : ")[0].strip()
    return "<none>"


def main():
    seed = 42
    if "--seed" in sys.argv:
        seed = int(sys.argv[sys.argv.index("--seed") + 1])
    rng = random.Random(seed)
    failures = 0
    total = 0

    for problem, proof in BASES:
        with open(proof) as f:
            steps = proover.parse_tstp(f.read())
        base_text = emit(steps)
        base = run_cli(problem, base_text)
        label = os.path.basename(proof)
        if base != "VerifiedGood":
            print(f"[skip] {label}: re-emitted base is {base}, cannot fuzz")
            continue
        for mutate in HARD + SOFT:
            for round_ in range(3):
                mutant = [Step(s.name, s.role, s.formula, s.source_kind,
                               s.file_ref, s.rule, s.status, list(s.premises),
                               s.annots) for s in steps]
                desc = mutate(mutant, rng)
                if desc is None:
                    break
                text = emit(mutant)
                if text == base_text:
                    continue
                verdict = run_cli(problem, text)
                hard = mutate in HARD
                total += 1
                ok = verdict != "VerifiedGood" if hard else True
                note = "" if verdict != "VerifiedGood" else \
                    (" !! ACCEPTED CORRUPTION" if hard else " (soft: may be valid)")
                print(f"  [{'PASS' if ok else 'FAIL'}] {label:14s} "
                      f"{desc:42s} -> {verdict}{note}")
                if not ok:
                    failures += 1

    print(f"\n{total - failures}/{total} mutations handled correctly")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
