#!/usr/bin/env python3
"""Run proover-check over the official ProoVer 2026 examples and synthetic
adversarial cases, asserting on the SZS status line.

Usage: python3 tests/run_tests.py [--skip-slow]
"""
import os, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
CLI = os.path.join(ROOT, "proover-check")
EXAMPLES = os.path.join(HERE, "examples")


def run(problem, proof, timeout=40):
    out = subprocess.run(
        [sys.executable, CLI, "--quiet", problem, proof],
        capture_output=True, text=True, timeout=timeout)
    for line in out.stdout.splitlines():
        if line.startswith("% SZS status "):
            return line[len("% SZS status "):].split(" : ")[0].strip()
    return f"<no status line: {out.stdout!r}>"


CORPUS = [
    (f"{EXAMPLES}/correct/Problems/COR001+1.p", f"{EXAMPLES}/correct/COR001+1.s", "VerifiedGood"),
    (f"{EXAMPLES}/correct/Problems/COR002+1.p", f"{EXAMPLES}/correct/COR002+1.s", "VerifiedGood"),
    (f"{EXAMPLES}/correct/Problems/COR003+1.p", f"{EXAMPLES}/correct/COR003+1.s", "VerifiedGood"),
    (f"{EXAMPLES}/incorrect/Problems/EVL001+1.p", f"{EXAMPLES}/incorrect/EVL001+1.s", "VerifiedBad"),
    (f"{EXAMPLES}/incorrect/Problems/EVL002+1.p", f"{EXAMPLES}/incorrect/EVL002+1.s", "VerifiedBad"),
    (f"{EXAMPLES}/incorrect/Problems/EVL003+1.p", f"{EXAMPLES}/incorrect/EVL003+1.s", "VerifiedBad"),
    (f"{EXAMPLES}/incorrect/Problems/EVL004+1.p", f"{EXAMPLES}/incorrect/EVL004+1.s", "VerifiedBad"),
    (f"{EXAMPLES}/samples/Problems/COR000+1.p", f"{EXAMPLES}/samples/COR000+1.s", "VerifiedGood"),
    (f"{EXAMPLES}/samples/Problems/EVL000+1.p", f"{EXAMPLES}/samples/EVL000+1.s", "VerifiedBad"),
]

# TMO000 hides a genuine flaw at sk219, so finding it beats timing out
SLOW = [
    (f"{EXAMPLES}/samples/Problems/TMO000+1.p", f"{EXAMPLES}/samples/TMO000+1.s",
     ("VerifiedBad", "Timeout")),
]

PROBLEM_1 = """
fof(a1, axiom, p(a) & ~p(b)).
fof(c, conjecture, ?[X] : ~(p(X) => ![Y] : (p(Y)))).
"""

SYNTHETIC = [
    ("correct proof", PROBLEM_1, """
fof(a1, axiom, p(a) & ~p(b), file('x.p', a1)).
fof(c, conjecture, ?[X] : ~(p(X) => ![Y] : (p(Y))), file('x.p', c)).
fof(s1, negated_conjecture, ![X] : (p(X) => ![Y] : (p(Y))), inference(negated_conjecture, [status(cth)], [c])).
fof(f1, plain, $false, inference(consequence, [status(thm)], [s1, a1])).
""", "VerifiedGood"),

    ("fabricated axiom", PROBLEM_1, """
fof(a1, axiom, p(a) & ~p(b), file('x.p', a1)).
fof(evil, axiom, $false).
fof(f1, plain, $false, inference(consequence, [status(thm)], [evil])).
""", "VerifiedBad"),

    ("tampered axiom", PROBLEM_1, """
fof(a1, axiom, p(a) & p(b), file('x.p', a1)).
fof(c, conjecture, ?[X] : ~(p(X) => ![Y] : (p(Y))), file('x.p', c)).
fof(s1, negated_conjecture, ![X] : (p(X) => ![Y] : (p(Y))), inference(negated_conjecture, [status(cth)], [c])).
fof(f1, plain, $false, inference(consequence, [status(thm)], [s1, a1])).
""", "VerifiedBad"),

    ("conjecture used as a premise", PROBLEM_1, """
fof(c, conjecture, ?[X] : ~(p(X) => ![Y] : (p(Y))), file('x.p', c)).
fof(f1, plain, $false, inference(consequence, [status(thm)], [c, c])).
""", "VerifiedBad"),

    ("forward premise reference", PROBLEM_1, """
fof(a1, axiom, p(a) & ~p(b), file('x.p', a1)).
fof(s1, plain, $false, inference(consequence, [status(thm)], [s2])).
fof(s2, plain, $false, inference(consequence, [status(thm)], [s1])).
""", "VerifiedBad"),

    ("no $false derived", PROBLEM_1, """
fof(a1, axiom, p(a) & ~p(b), file('x.p', a1)).
fof(s1, plain, p(a), inference(consequence, [status(thm)], [a1])).
""", "VerifiedBad"),

    ("duplicate step names", PROBLEM_1, """
fof(a1, axiom, p(a) & ~p(b), file('x.p', a1)).
fof(a1, axiom, $false, file('x.p', a1)).
fof(f1, plain, $false, inference(consequence, [status(thm)], [a1])).
""", "VerifiedBad"),

    ("unjustified inference", PROBLEM_1, """
fof(a1, axiom, p(a) & ~p(b), file('x.p', a1)).
fof(s1, plain, $false, inference(consequence, [status(thm)], [a1])).
""", "VerifiedBad"),

    ("empty proof", PROBLEM_1, "% nothing here\n", "VerifiedBad"),

    ("garbage proof", PROBLEM_1, "this is (not a proof\n", "VerifiedBad"),

    ("negation skips status cth", PROBLEM_1, """
fof(c, conjecture, ?[X] : ~(p(X) => ![Y] : (p(Y))), file('x.p', c)).
fof(s1, negated_conjecture, ![X] : (p(X) => ![Y] : (p(Y))), inference(negated_conjecture, [status(thm)], [c])).
fof(a1, axiom, p(a) & ~p(b), file('x.p', a1)).
fof(f1, plain, $false, inference(consequence, [status(thm)], [s1, a1])).
""", "VerifiedBad"),

    ("skolemize old annotation dialect", """
fof(marriage, axiom, ! [M] : ? [B] : in_love(B, M)).
fof(c, conjecture, ?[X,Y] : in_love(X, Y)).
""", """
fof(marriage, axiom, ! [M] : ? [B] : in_love(B, M), file('x.p', marriage)).
fof(c, conjecture, ?[X,Y] : in_love(X, Y), file('x.p', c)).
fof(nc, negated_conjecture, ~(?[X,Y] : in_love(X, Y)), inference(negated_conjecture, [status(cth)], [c])).
fof(sk, plain, ! [M] : in_love(sK0(M), M),
    inference(skolemize, [status(esa), new_symbols(skolem, [sK0]), skolemized(B), bind(B, sK0(M))], [marriage])).
fof(i1, plain, in_love(sK0(m0), m0), inference(instantiate, [status(thm)], [sk])).
fof(f1, plain, $false, inference(consequence, [status(thm)], [nc, i1])).
""", "VerifiedGood"),
]


def main():
    skip_slow = "--skip-slow" in sys.argv
    failures = 0
    total = 0

    def check(label, got, want):
        nonlocal failures, total
        total += 1
        ok = got in want if isinstance(want, tuple) else got == want
        print(f"  [{'PASS' if ok else 'FAIL'}] {label:45s} -> {got}"
              + ("" if ok else f"   (expected {want})"))
        if not ok:
            failures += 1

    print("official corpus:")
    for problem, proof, want in CORPUS:
        check(os.path.basename(proof), run(problem, proof), want)
    if not skip_slow:
        for problem, proof, want in SLOW:
            check(os.path.basename(proof), run(problem, proof), want)

    print("synthetic cases:")
    with tempfile.TemporaryDirectory() as d:
        for label, problem, proof, want in SYNTHETIC:
            pp = os.path.join(d, "x.p")
            sp = os.path.join(d, "x.s")
            with open(pp, "w") as f: f.write(problem)
            with open(sp, "w") as f: f.write(proof)
            check(label, run(pp, sp), want)

    print(f"\n{total - failures}/{total} passed")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
