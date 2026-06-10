from __future__ import annotations
import os, re, sys, subprocess, tempfile, itertools, shutil
from dataclasses import dataclass, field


@dataclass(frozen=True)
class Var:   name: str
@dataclass(frozen=True)
class Func:
    name: str
    args: tuple = ()

@dataclass(frozen=True)
class Atom:  pred: str; args: tuple = ()
@dataclass(frozen=True)
class Eq:    lhs: object; rhs: object
@dataclass(frozen=True)
class Not:   sub: object
@dataclass(frozen=True)
class And:   l: object; r: object
@dataclass(frozen=True)
class Or:    l: object; r: object
@dataclass(frozen=True)
class Implies: l: object; r: object
@dataclass(frozen=True)
class Iff:   l: object; r: object
@dataclass(frozen=True)
class Forall: var: str; body: object
@dataclass(frozen=True)
class Exists: var: str; body: object

TOKEN = re.compile(r"""
    \s+                      |
    (?P<op><=>|=>|<=|<~>|~\||~&|[&|~()\[\],:=]|!=|\?|!) |
    (?P<id>[A-Za-z_$][A-Za-z0-9_$]*)
""", re.VERBOSE)

def tokenize(s):
    toks = []
    for m in TOKEN.finditer(s):
        if m.group('op'):  toks.append(m.group('op'))
        elif m.group('id'): toks.append(m.group('id'))
    return toks

class Parser:
    def __init__(self, toks): self.t = toks; self.i = 0
    def peek(self): return self.t[self.i] if self.i < len(self.t) else None
    def next(self):
        x = self.t[self.i]; self.i += 1; return x
    def expect(self, x):
        got = self.next()
        if got != x: raise SyntaxError(f"expected {x!r}, got {got!r}")

    def formula(self): return self.iff()
    def iff(self):
        l = self.implies()
        while self.peek() in ('<=>', '<~>'):
            op = self.next(); r = self.implies()
            l = Iff(l, r) if op == '<=>' else Not(Iff(l, r))
        return l
    def implies(self):
        l = self.disj()
        if self.peek() == '=>': self.next(); return Implies(l, self.implies())
        if self.peek() == '<=': self.next(); return Implies(self.implies(), l)
        return l
    def disj(self):
        l = self.conj()
        while self.peek() == '|': self.next(); l = Or(l, self.conj())
        return l
    def conj(self):
        l = self.unary()
        while self.peek() == '&': self.next(); l = And(l, self.unary())
        return l
    def unary(self):
        if self.peek() == '~': self.next(); return Not(self.unary())
        if self.peek() in ('!', '?'):
            q = self.next(); self.expect('[')
            vs = [self.next()]
            while self.peek() == ',': self.next(); vs.append(self.next())
            self.expect(']'); self.expect(':')
            body = self.unary()
            for v in reversed(vs):
                body = Forall(v, body) if q == '!' else Exists(v, body)
            return body
        if self.peek() == '(':
            self.next(); f = self.formula(); self.expect(')'); return f
        return self.atom()
    def atom(self):
        name = self.next()
        if name == '$false': return Atom('$false')
        if name == '$true':  return Atom('$true')
        args = ()
        if self.peek() == '(':
            self.next(); args = [self.term()]
            while self.peek() == ',': self.next(); args.append(self.term())
            self.expect(')'); args = tuple(args)
        if self.peek() in ('=', '!='):
            op = self.next()
            lhs = Func(name, args) if args or name[0].islower() else Var(name)
            rhs = self.term()
            eq = Eq(lhs, rhs)
            return Not(eq) if op == '!=' else eq
        return Atom(name, args)
    def term(self):
        name = self.next()
        if self.peek() == '(':
            self.next(); args = [self.term()]
            while self.peek() == ',': self.next(); args.append(self.term())
            self.expect(')'); return Func(name, tuple(args))
        return Var(name) if name[0].isupper() else Func(name, ())

def parse_formula(s): return Parser(tokenize(s)).formula()

def subst_term(t, m):
    if isinstance(t, Var):  return m.get(t.name, t)
    if isinstance(t, Func): return Func(t.name, tuple(subst_term(a, m) for a in t.args))
    return t

_fresh = (f"_z{i}" for i in itertools.count())
def subst(f, m):
    if isinstance(f, Atom): return Atom(f.pred, tuple(subst_term(a, m) for a in f.args))
    if isinstance(f, Eq):   return Eq(subst_term(f.lhs, m), subst_term(f.rhs, m))
    if isinstance(f, Not):  return Not(subst(f.sub, m))
    if isinstance(f, And):  return And(subst(f.l, m), subst(f.r, m))
    if isinstance(f, Or):   return Or(subst(f.l, m), subst(f.r, m))
    if isinstance(f, Implies): return Implies(subst(f.l, m), subst(f.r, m))
    if isinstance(f, Iff):  return Iff(subst(f.l, m), subst(f.r, m))
    if isinstance(f, (Forall, Exists)):
        cls = type(f)
        if f.var in m:
            m = {k: v for k, v in m.items() if k != f.var}
        if any(f.var in term_vars(v) for v in m.values()):
            nv = next(_fresh)
            body = subst(f.body, {f.var: Var(nv)})
            return cls(nv, subst(body, m))
        return cls(f.var, subst(f.body, m))
    return f

def term_vars(t):
    if isinstance(t, Var):  return {t.name}
    if isinstance(t, Func): return set().union(*[term_vars(a) for a in t.args]) if t.args else set()
    return set()

def pp_term(t):
    if isinstance(t, Var):  return t.name
    if isinstance(t, Func): return t.name + (f"({','.join(pp_term(a) for a in t.args)})" if t.args else "")
def pp(f):
    if isinstance(f, Atom): return f.pred + (f"({','.join(pp_term(a) for a in f.args)})" if f.args else "")
    if isinstance(f, Eq):   return f"{pp_term(f.lhs)}={pp_term(f.rhs)}"
    if isinstance(f, Not):  return f"~{pp(f.sub)}"
    if isinstance(f, And):  return f"({pp(f.l)} & {pp(f.r)})"
    if isinstance(f, Or):   return f"({pp(f.l)} | {pp(f.r)})"
    if isinstance(f, Implies): return f"({pp(f.l)} => {pp(f.r)})"
    if isinstance(f, Iff):  return f"({pp(f.l)} <=> {pp(f.r)})"
    if isinstance(f, Forall): return f"![{f.var}]:{pp(f.body)}"
    if isinstance(f, Exists): return f"?[{f.var}]:{pp(f.body)}"

def alpha_norm(f, env=None, counter=None):
    env = env or {}; counter = counter or itertools.count()
    def t(x):
        if isinstance(x, Var):  return Var(env.get(x.name, x.name))
        if isinstance(x, Func): return Func(x.name, tuple(t(a) for a in x.args))
    def go(g, env):
        if isinstance(g, Atom): return Atom(g.pred, tuple(t(a) for a in g.args))
        if isinstance(g, Eq):   return Eq(t(g.lhs), t(g.rhs))
        if isinstance(g, Not):  return Not(go(g.sub, env))
        if isinstance(g, (And, Or, Implies, Iff)):
            return type(g)(go(g.l, env), go(g.r, env))
        if isinstance(g, (Forall, Exists)):
            nv = f"V{next(counter)}"; env2 = {**env, g.var: nv}
            return type(g)(nv, go(g.body, env2))
    def t(x, env=env):
        if isinstance(x, Var):  return Var(env.get(x.name, x.name))
        if isinstance(x, Func): return Func(x.name, tuple(t(a, env) for a in x.args))
    def go(g, env):
        if isinstance(g, Atom): return Atom(g.pred, tuple(t(a, env) for a in g.args))
        if isinstance(g, Eq):   return Eq(t(g.lhs, env), t(g.rhs, env))
        if isinstance(g, Not):  return Not(go(g.sub, env))
        if isinstance(g, (And, Or, Implies, Iff)):
            return type(g)(go(g.l, env), go(g.r, env))
        if isinstance(g, (Forall, Exists)):
            nv = f"V{next(counter)}"
            return type(g)(nv, go(g.body, {**env, g.var: nv}))
    return go(f, env)

def equal_mod_alpha(a, b):
    return alpha_norm(a) == alpha_norm(b)

def func_symbols(f):
    out = set()
    def t(x):
        if isinstance(x, Func): out.add(x.name); [t(a) for a in x.args]
    def go(g):
        if isinstance(g, Atom): [t(a) for a in g.args]
        elif isinstance(g, Eq): t(g.lhs); t(g.rhs)
        elif isinstance(g, Not): go(g.sub)
        elif isinstance(g, (And, Or, Implies, Iff)): go(g.l); go(g.r)
        elif isinstance(g, (Forall, Exists)): go(g.body)
    go(f); return out

@dataclass
class Step:
    name: str
    role: str
    formula: object
    rule: str = None
    status: str = None
    premises: list = field(default_factory=list)
    annots: str = ""

def split_top(s, sep=','):
    "split on top-level separators, respecting (), []"
    depth = 0; cur = ''; out = []
    for c in s:
        if c in '([': depth += 1
        elif c in ')]': depth -= 1
        if c == sep and depth == 0: out.append(cur); cur = ''
        else: cur += c
    if cur.strip(): out.append(cur)
    return out

def parse_tstp(text):
    text = re.sub(r'%[^\n]*', '', text)
    steps = []
    for m in re.finditer(r'fof\((.*?)\)\.\s*', text, re.DOTALL):
        body = m.group(1)
        parts = split_top(body)
        name, role, formula_txt = parts[0].strip(), parts[1].strip(), parts[2].strip()
        rule = status = None; premises = []; annots = ''
        if len(parts) > 3:
            inf = ','.join(parts[3:]).strip()
            im = re.match(r'inference\((\w+)\s*,\s*\[(.*)\]\s*,\s*\[(.*)\]\)', inf, re.DOTALL)
            if im:
                rule = im.group(1); annots = im.group(2)
                sm = re.search(r'status\((\w+)\)', annots)
                status = sm.group(1) if sm else None
                premises = [p.strip() for p in split_top(im.group(3)) if p.strip()]
        steps.append(Step(name, role, parse_formula(formula_txt),
                          rule, status, premises, annots))
    return steps


GOOD, BAD, UNSURE = "GOOD", "BAD", "UNSURE"

def negate(f):
    return f.sub if isinstance(f, Not) else Not(f)

def check_negated_conjecture(step, premises):
    """status must be cth; formula must equal the negation of the (single) parent,
       pushed to NNF over the top quantifier. We check the simplest sound thing:
       step.formula must be logically the negation -- we verify it via the prover
       by asking whether (parent <=> ~step) is a theorem."""
    if step.status != 'cth':
        return BAD, f"negated_conjecture must have status cth, got {step.status}"
    if len(premises) != 1:
        return UNSURE, "expected exactly one parent"
    parent = premises[0].formula
    r = ATP.decide(Iff(step.formula, negate(parent)))
    if r == "Theorem":            return GOOD, "formula is the correct negation of the conjecture"
    if r == "CounterSatisfiable": return BAD,  "formula is NOT the negation of the conjecture"
    return UNSURE, "prover could not decide negation equivalence"

def check_skolemize(step, premises, used_syms):
    if step.status != 'esa':
        return BAD, f"skolemize must have status esa, got {step.status}"
    if len(premises) != 1:
        return UNSURE, "expected exactly one parent"
    parent = premises[0].formula
    ns = re.search(r'new_symbols\(skolem,\s*\[(\w+)\]\)', step.annots)
    sk = re.search(r'skolemized\((\w+)\)', step.annots)
    bd = re.search(r'bind\(\s*(\w+)\s*,\s*(.+?)\)\s*$', step.annots.strip())
    if not (ns and sk and bd):
        return UNSURE, "missing new_symbols / skolemized / bind annotation"
    new_sym, sk_var, bind_var = ns.group(1), sk.group(1), bd.group(1)
    if sk_var != bind_var:
        return BAD, f"skolemized({sk_var}) disagrees with bind({bind_var},...)"

    if new_sym in used_syms:
        return BAD, f"Skolem symbol {new_sym} is reused (must be fresh)"

    scope, node = [], parent
    while True:
        if isinstance(node, Forall):
            scope.append(node.var); node = node.body
        elif isinstance(node, Exists):
            if node.var == sk_var: break
            return UNSURE, "existential nesting not handled by this teaching checker"
        else:
            return BAD, f"no existential {sk_var} found at expected position"

    bind_term = Parser(tokenize(bd.group(2))).term()
    expected = Func(new_sym, tuple(Var(v) for v in scope)) if scope else Func(new_sym, ())
    if pp_term(bind_term) != pp_term(expected):
        return BAD, (f"Skolem term {pp_term(bind_term)} should depend on exactly "
                     f"the universals in scope: expected {pp_term(expected)}")

    rebuilt = node.body
    rebuilt = subst(rebuilt, {sk_var: bind_term})
    for v in reversed(scope):
        rebuilt = Forall(v, rebuilt)
    if equal_mod_alpha(rebuilt, step.formula):
        return GOOD, f"correct Skolemization introducing {pp_term(expected)}"
    return BAD, (f"resulting formula is wrong; expected {pp(rebuilt)} "
                 f"but step states {pp(step.formula)}")

class ATP:
    BIN = os.environ.get("ATP_EPROVER_BIN", "eprover-rel")
    TIMEOUT = 10

    @staticmethod
    def _bin_path():
        candidate = ATP.BIN
        path = candidate if os.path.isabs(candidate) else shutil.which(candidate)
        if path and os.access(path, os.X_OK):
            return path
        raise RuntimeError(
            "External prover 'eprover-rel' is not available. "
            "Install it or set ATP_EPROVER_BIN to an executable E prover binary."
        )

    @staticmethod
    def _run(problem):
        with tempfile.NamedTemporaryFile('w', suffix='.p', delete=False) as fh:
            fh.write(problem); path = fh.name
        try:
            bin_path = ATP._bin_path()
            out = subprocess.run(
                [bin_path, "--auto", "--silent", "-s", "--proof-object=0",
                 f"--cpu-limit={ATP.TIMEOUT}", path],
                capture_output=True, text=True, timeout=ATP.TIMEOUT + 5).stdout
        except subprocess.TimeoutExpired:
            return "Timeout"
        except RuntimeError:
            raise
        except (FileNotFoundError, PermissionError) as e:
            raise RuntimeError(
                f"Unable to execute external prover '{ATP.BIN}': {e.strerror or e}"
            ) from e
        m = re.search(r'SZS status (\w+)', out)
        return m.group(1) if m else "Unknown"

    @staticmethod
    def entails(premises, conclusion):
        """Return GOOD if premises |- conclusion, BAD if premises |- ~conclusion,
           UNSURE otherwise. This is the conservative three-way decision."""
        ax = "\n".join(f"fof(p{i}, axiom, {pp(p.formula)})." for i, p in enumerate(premises))
        pos = ATP._run(ax + f"\nfof(goal, conjecture, {pp(conclusion)}).")
        if pos in ("Theorem", "ContradictoryAxioms"):
            return GOOD
        neg = ATP._run(ax + f"\nfof(goal, conjecture, {pp(negate(conclusion))}).")
        if neg in ("Theorem", "ContradictoryAxioms"):
            return BAD
        return UNSURE

    @staticmethod
    def decide(formula):
        "Raw SZS status for a standalone conjecture (Theorem / CounterSatisfiable / ...)."
        return ATP._run(f"fof(goal, conjecture, {pp(formula)}).")

    @staticmethod
    def is_valid(formula):
        r = ATP._run(f"fof(goal, conjecture, {pp(formula)}).")
        if r == "Theorem": return True
        n = ATP._run(f"fof(goal, conjecture, {pp(negate(formula))}).")
        if n == "Theorem": return False
        return None

def check_proof(text, verbose=True):
    try:
        steps = parse_tstp(text)
    except Exception as e:
        return "NotVerified", [f"parse error: {e}"]

    by_name = {s.name: s for s in steps}
    used_syms = set()
    for s in steps:
        used_syms |= func_symbols(s.formula)

    log = []
    found_bad = False
    found_unsure = False

    for s in steps:
        if s.rule is None:
            log.append((s.name, s.role, GOOD, "input formula, accepted"))
            continue
        prem = [by_name[p] for p in s.premises if p in by_name]
        if s.rule == 'skolemize':
            before = set().union(*[func_symbols(by_name[p].formula) for p in s.premises]) \
                     if s.premises else set()
            verdict, why = check_skolemize(s, prem, before)
        elif s.rule == 'negated_conjecture':
            verdict, why = check_negated_conjecture(s, prem)
        else:
            if s.status not in ('thm', 'cth'):
                verdict, why = UNSURE, f"external rule with non-thm status {s.status}"
            else:
                v = ATP.entails(prem, s.formula)
                verdict = v
                why = {GOOD: "ATP confirms premises entail conclusion",
                       BAD:  "ATP shows premises entail the NEGATION of conclusion",
                       UNSURE: "ATP could not confirm the step"}[v]
        log.append((s.name, s.rule, verdict, why))
        if verdict == BAD:    found_bad = True
        if verdict == UNSURE: found_unsure = True

    if verbose:
        for name, kind, verdict, why in log:
            tag = {GOOD: "ok  ", BAD: "BAD ", UNSURE: "????"}[verdict]
            print(f"   [{tag}] {name:18s} {kind:18s} {why}")

    if found_bad:    return "FailedVerified", log
    if found_unsure: return "NotVerified", log
    return "Verified", log


CORRECT_1 = """
fof(a1, axiom, p(a) & ~p(b)).
fof(c, conjecture, ?[X] : ~(p(X) => ![Y] : (p(Y)))).
fof(s1, negated_conjecture, ![X] : (p(X) => ![Y] : (p(Y))), inference(negated_conjecture, [status(cth)], [c])).
fof(f1, plain, $false, inference(consequence, [status(thm)], [s1, a1])).
"""

CORRECT_3 = """
fof(marriage, plain, ! [Marriage] : ? [Bride] : ? [Groom] : in_love(Groom, Bride)).
fof(bride, plain, ! [Marriage] : ? [Groom] : in_love(Groom, sK0(Marriage)),
    inference(skolemize, [status(esa), new_symbols(skolem, [sK0]), skolemized(Bride), bind(Bride, sK0(Marriage))], [marriage])).
fof(groom, plain, ! [Marriage] : in_love(sK1(Marriage), sK0(Marriage)),
    inference(skolemize, [status(esa), new_symbols(skolem, [sK1]), skolemized(Groom), bind(Groom, sK1(Marriage))], [bride])).
"""

EVIL_1 = """
fof(a1, axiom, p(a)).
fof(c, conjecture, ![X] : (p(X))).
fof(s1, negated_conjecture, ![X] : (~p(X)), inference(negated_conjecture, [status(cth)], [c])).
fof(f1, plain, $false, inference(consequence, [status(thm)], [s1, a1])).
"""

EVIL_3 = """
fof(marriage,plain, ! [Marriage] : ? [Bride] : ? [Groom] : in_love(Groom,Bride) ).
fof(bride,plain, ! [Marriage] : ? [Groom] : in_love(Groom,sK0(Marriage)),
    inference(skolemize, [status(esa), new_symbols(skolem, [sK0]), skolemized(Bride), bind(Bride, sK0(Marriage))], [marriage])).
fof(groom,plain, ! [Marriage] : in_love(sK0(Marriage),sK0(Marriage)),
    inference(skolemize,[status(esa), new_symbols(skolem, [sK0]), skolemized(Groom), bind(Groom, sK0(Marriage))], [bride])).
"""

EVIL_4 = """
fof(marriage,plain, ! [Marriage] : ? [Bride] : ? [Groom] : in_love(Groom,Bride) ).
fof(bride,plain, ! [Marriage] : ? [Groom] : in_love(Groom,sK0(Marriage)),
    inference(skolemize, [status(esa), new_symbols(skolem, [sK0]), skolemized(Bride), bind(Bride, sK0(Marriage))], [marriage])).
fof(groom,plain, ! [Marriage] : in_love(Marriage,sK0(Marriage)),
    inference(skolemize, [status(esa), new_symbols(skolem, [sK1]), skolemized(Groom), bind(Groom, sK1(Marriage))], [bride])).
"""

TESTS = [
    ("Correct #1 (negated_conjecture + ATP)", CORRECT_1, "Verified"),
    ("Correct #3 (two Skolemizations)",        CORRECT_3, "Verified"),
    ("Evil #1 (wrong negation)",               EVIL_1,    "FailedVerified"),
    ("Evil #3 (reused Skolem symbol)",         EVIL_3,    "FailedVerified"),
    ("Evil #4 (Skolem symbol not applied)",    EVIL_4,    "FailedVerified"),
]

if __name__ == "__main__":
    try:
        for label, proof, expected in TESTS:
            print(f"\n=== {label} ===")
            verdict, _ = check_proof(proof)
            flag = "PASS" if verdict == expected else "!! MISMATCH"
            print(f"   --> verdict: {verdict}   (expected {expected})  [{flag}]")
    except RuntimeError as e:
        print(f"error: {e}")
        sys.exit(1)
