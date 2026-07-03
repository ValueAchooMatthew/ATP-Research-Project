"""Semantic verifier for TSTP refutation proofs of FOF problems (ProoVer 2026).

Verdicts: VerifiedGood, VerifiedBad, Unknown. Running out of the wall-clock
budget raises OutOfTime, which the CLI reports as Timeout. The external ATP
is only ever invoked on a single step together with its own premises.
"""
from __future__ import annotations
import os, re, subprocess, tempfile, itertools, shutil, time
from dataclasses import dataclass, field


class OutOfTime(Exception):
    pass


class Deadline:
    def __init__(self, seconds=None):
        self.start = time.monotonic()
        self.limit = seconds

    def remaining(self):
        if self.limit is None:
            return float("inf")
        return self.limit - (time.monotonic() - self.start)

    def check(self, margin=0.5):
        if self.remaining() < margin:
            raise OutOfTime()


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
    \s+                                   |
    (?P<op><=>|=>|<=|<~>|~\||~&|!=|[&|~()\[\],:=?!]) |
    (?P<id>[A-Za-z_$][A-Za-z0-9_$]*)      |
    (?P<num>\d+(?:\.\d+)?)                |
    (?P<q>'(?:[^'\\]|\\.)*'|"(?:[^"\\]|\\.)*")
""", re.VERBOSE)

def tokenize(s):
    residue = TOKEN.sub('', s)
    if residue:
        raise SyntaxError(f"unexpected character {residue[:10]!r}")
    return [a or b or c or d for a, b, c, d in TOKEN.findall(s) if a or b or c or d]

def _is_var_name(name):
    return name[0].isupper() or name[0] == '_'

class Parser:
    def __init__(self, toks): self.t = toks; self.i = 0
    def peek(self): return self.t[self.i] if self.i < len(self.t) else None
    def next(self):
        if self.i >= len(self.t):
            raise SyntaxError("unexpected end of formula")
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
            lhs = Func(name, args) if args or not _is_var_name(name) else Var(name)
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
        return Var(name) if _is_var_name(name) else Func(name, ())

def parse_formula(s):
    p = Parser(tokenize(s))
    f = p.formula()
    if p.peek() is not None:
        raise SyntaxError(f"trailing tokens after formula: {p.peek()!r}")
    return f

def parse_term(s):
    p = Parser(tokenize(s))
    t = p.term()
    if p.peek() is not None:
        raise SyntaxError(f"trailing tokens after term: {p.peek()!r}")
    return t


def subst_term(t, m):
    if isinstance(t, Var):  return m.get(t.name, t)
    if isinstance(t, Func): return Func(t.name, tuple(subst_term(a, m) for a in t.args))
    return t

_fresh = (f"_z{i}" for i in itertools.count())
def subst(f, m):
    if isinstance(f, Atom): return Atom(f.pred, tuple(subst_term(a, m) for a in f.args))
    if isinstance(f, Eq):   return Eq(subst_term(f.lhs, m), subst_term(f.rhs, m))
    if isinstance(f, Not):  return Not(subst(f.sub, m))
    if isinstance(f, (And, Or, Implies, Iff)):
        return type(f)(subst(f.l, m), subst(f.r, m))
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

def free_vars(f):
    if isinstance(f, Atom): return set().union(*[term_vars(a) for a in f.args]) if f.args else set()
    if isinstance(f, Eq):   return term_vars(f.lhs) | term_vars(f.rhs)
    if isinstance(f, Not):  return free_vars(f.sub)
    if isinstance(f, (And, Or, Implies, Iff)): return free_vars(f.l) | free_vars(f.r)
    if isinstance(f, (Forall, Exists)): return free_vars(f.body) - {f.var}
    return set()

def universal_closure(f):
    for v in sorted(free_vars(f), reverse=True):
        f = Forall(v, f)
    return f

def pp_term(t):
    if isinstance(t, Var):  return t.name
    if isinstance(t, Func): return t.name + (f"({','.join(pp_term(a) for a in t.args)})" if t.args else "")
    raise TypeError(f"not a term: {t!r}")

def pp(f):
    if isinstance(f, Atom): return f.pred + (f"({','.join(pp_term(a) for a in f.args)})" if f.args else "")
    if isinstance(f, Eq):   return f"{pp_term(f.lhs)}={pp_term(f.rhs)}"
    if isinstance(f, Not):
        if isinstance(f.sub, Eq):
            return f"{pp_term(f.sub.lhs)}!={pp_term(f.sub.rhs)}"
        return f"~({pp(f.sub)})"
    if isinstance(f, And):  return f"({pp(f.l)} & {pp(f.r)})"
    if isinstance(f, Or):   return f"({pp(f.l)} | {pp(f.r)})"
    if isinstance(f, Implies): return f"({pp(f.l)} => {pp(f.r)})"
    if isinstance(f, Iff):  return f"({pp(f.l)} <=> {pp(f.r)})"
    if isinstance(f, Forall): return f"(![{f.var}]:{pp(f.body)})"
    if isinstance(f, Exists): return f"(?[{f.var}]:{pp(f.body)})"
    raise TypeError(f"not a formula: {f!r}")

def alpha_norm(f):
    counter = itertools.count()
    def t(x, env):
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
    return go(f, {})

def equal_mod_alpha(a, b):
    return a == b or alpha_norm(a) == alpha_norm(b)

def func_symbols(f):
    out = set()
    def t(x):
        if isinstance(x, Func):
            out.add(x.name)
            for a in x.args: t(a)
    def go(g):
        if isinstance(g, Atom):
            for a in g.args: t(a)
        elif isinstance(g, Eq): t(g.lhs); t(g.rhs)
        elif isinstance(g, Not): go(g.sub)
        elif isinstance(g, (And, Or, Implies, Iff)): go(g.l); go(g.r)
        elif isinstance(g, (Forall, Exists)): go(g.body)
    go(f); return out

def pred_symbols(f):
    out = set()
    def go(g):
        if isinstance(g, Atom):
            if g.pred not in ('$false', '$true'):
                out.add(g.pred)
        elif isinstance(g, Not): go(g.sub)
        elif isinstance(g, (And, Or, Implies, Iff)): go(g.l); go(g.r)
        elif isinstance(g, (Forall, Exists)): go(g.body)
    go(f); return out

def negate(f):
    return f.sub if isinstance(f, Not) else Not(f)


def strip_closure(f):
    while isinstance(f, Forall):
        f = f.body
    return f

def _clause_literals(f):
    lits = []
    def go(g):
        if isinstance(g, Or):
            return go(g.l) and go(g.r)
        neg = isinstance(g, Not)
        if neg:
            g = g.sub
        if isinstance(g, (Atom, Eq)):
            lits.append((neg, g))
            return True
        return False
    return lits if go(strip_closure(f)) else None

def _match_term(a, b, m, rm):
    if isinstance(a, Var) and isinstance(b, Var):
        if m.get(a.name, b.name) != b.name or rm.get(b.name, a.name) != a.name:
            return False
        m[a.name] = b.name; rm[b.name] = a.name
        return True
    if isinstance(a, Func) and isinstance(b, Func):
        return (a.name == b.name and len(a.args) == len(b.args)
                and all(_match_term(x, y, m, rm) for x, y in zip(a.args, b.args)))
    return False

def _match_atom(a, b, m, rm):
    if isinstance(a, Atom) and isinstance(b, Atom):
        return (a.pred == b.pred and len(a.args) == len(b.args)
                and all(_match_term(x, y, m, rm) for x, y in zip(a.args, b.args)))
    if isinstance(a, Eq) and isinstance(b, Eq):
        save = dict(m), dict(rm)
        if _match_term(a.lhs, b.lhs, m, rm) and _match_term(a.rhs, b.rhs, m, rm):
            return True
        m.clear(); m.update(save[0]); rm.clear(); rm.update(save[1])
        return (_match_term(a.lhs, b.rhs, m, rm)
                and _match_term(a.rhs, b.lhs, m, rm))
    return False

def clause_equal(a, b):
    """Clause equality up to variable renaming, literal order, and equation
    orientation."""
    la, lb = _clause_literals(a), _clause_literals(b)
    if la is None or lb is None or len(la) != len(lb):
        return False

    def backtrack(i, used, m, rm):
        if i == len(la):
            return True
        nega, atoma = la[i]
        for j, (negb, atomb) in enumerate(lb):
            if j in used or nega != negb:
                continue
            m2, rm2 = dict(m), dict(rm)
            if _match_atom(atoma, atomb, m2, rm2):
                if backtrack(i + 1, used | {j}, m2, rm2):
                    return True
        return False

    return backtrack(0, frozenset(), {}, {})

def same_formula(a, b):
    return equal_mod_alpha(a, b) or clause_equal(a, b)


@dataclass
class Step:
    name: str
    role: str
    formula: object
    source_kind: str = None            # None | 'file' | 'inference' | 'introduced' | 'copy'
    file_ref: str = None
    rule: str = None
    status: str = None
    premises: list = field(default_factory=list)
    annots: str = ""
    opaque_premises: bool = False
    statuses: frozenset = frozenset()  # every status() across a nested chain


def strip_comments(text):
    out = []
    for line in text.split("\n"):
        if "%" in line or "#" in line:
            quoted = False
            for i, c in enumerate(line):
                if c == "'":
                    quoted = not quoted
                elif c in "%#" and not quoted:
                    line = line[:i]
                    break
        out.append(line)
    return "\n".join(out)

def annotated_units(text, deadline=None):
    units = []
    n = len(text)
    i = 0
    while True:
        if deadline is not None:
            deadline.check()
        jf = text.find("fof", i)
        jc = text.find("cnf", i)
        js = [j for j in (jf, jc) if j != -1]
        if not js:
            break
        j = min(js)
        lang = text[j:j + 3]
        before = text[j - 1] if j > 0 else ""
        if before.isalnum() or before in ("_", "$"):
            i = j + 3
            continue
        k = j + 3
        while k < n and text[k].isspace():
            k += 1
        if k >= n or text[k] != "(":
            i = j + 3
            continue
        depth = 0
        quoted = False
        start = k + 1
        p = k
        while p < n:
            c = text[p]
            if quoted:
                if c == "'":
                    quoted = False
            elif c == "'":
                quoted = True
            elif c == "(":
                depth += 1
            elif c == ")":
                depth -= 1
                if depth == 0:
                    units.append((lang, text[start:p]))
                    break
            p += 1
        else:
            raise SyntaxError("unbalanced parentheses in annotated formula")
        i = p + 1
    return units

def split_top(s, sep=','):
    depth = 0; quoted = False; cur = ''; out = []
    for c in s:
        if quoted:
            cur += c
            if c == "'":
                quoted = False
            continue
        if c == "'":
            quoted = True; cur += c; continue
        if c in '([': depth += 1
        elif c in ')]': depth -= 1
        if c == sep and depth == 0:
            out.append(cur); cur = ''
        else:
            cur += c
    if cur.strip():
        out.append(cur)
    return out

_NAME = re.compile(r"^(?:[A-Za-z0-9_$]+|'(?:[^'\\]|\\.)*')$")
_STATUS = re.compile(r"status\((\w+)\)")
_FILE = re.compile(r"file\(\s*('(?:[^'\\]|\\.)*'|[^',()]*)\s*"
                   r"(?:,\s*([\w$]+|'(?:[^'\\]|\\.)*'))?\s*\)\s*$")

def _inference_fields(src):
    s = src.strip()
    if not s.startswith("inference"):
        return None
    body = s[len("inference"):].strip()
    if not (body.startswith("(") and body.endswith(")")):
        return None
    fields = [f.strip() for f in split_top(body[1:-1])]
    if len(fields) != 3:
        return None
    annots, plist = fields[1], fields[2]
    if not (annots.startswith("[") and annots.endswith("]")
            and plist.startswith("[") and plist.endswith("]")):
        return None
    return fields[0], annots[1:-1], plist[1:-1]

def _flatten_inference(src):
    """Flatten a possibly-nested inference(...) term into
    (rule, status, all statuses, leaf premise names, annots, opaque)."""
    f = _inference_fields(src)
    if f is None:
        return None
    rule, annots, plist = f
    sm = _STATUS.search(annots)
    status = sm.group(1) if sm else None
    statuses = {status}
    leaves, opaque = [], False
    for p in (q.strip() for q in split_top(plist)):
        if not p:
            continue
        if _NAME.match(p):
            leaves.append(p)
        elif p.startswith("inference"):
            sub = _flatten_inference(p)
            if sub is None:
                opaque = True
            else:
                statuses |= sub[2]; leaves += sub[3]; opaque |= sub[5]
        elif p.startswith("theory(") or p.startswith("introduced("):
            pass
        else:
            opaque = True
    return rule, status, frozenset(statuses), leaves, annots, opaque

def parse_annotated(lang, unit):
    parts = split_top(unit)
    if len(parts) < 3:
        raise SyntaxError(f"annotated formula with only {len(parts)} fields")
    name = parts[0].strip()
    role = parts[1].strip()
    formula = parse_formula(parts[2].strip())
    if lang == 'cnf':
        formula = universal_closure(formula)
    step = Step(name, role, formula)
    if len(parts) > 3:
        source = parts[3].strip()
        fm = _FILE.match(source)
        im = re.match(r"introduced\(\s*(\w+)", source)
        flat = None if (fm or im) else _flatten_inference(source)
        if fm:
            step.source_kind = 'file'
            step.file_ref = fm.group(2)
        elif im:
            step.source_kind = 'introduced'
            step.rule = im.group(1)
        elif flat:
            step.source_kind = 'inference'
            (step.rule, step.status, step.statuses,
             step.premises, step.annots, step.opaque_premises) = flat
        elif _NAME.match(source):
            step.source_kind = 'copy'
            step.file_ref = source
    return step

def parse_tstp(text, deadline=None):
    return [parse_annotated(lang, u)
            for lang, u in annotated_units(strip_comments(text), deadline)]


_INCLUDE = re.compile(r"include\(\s*'([^']+)'\s*(?:,\s*\[[^\]]*\])?\s*\)\s*\.")

def expand_includes(text, base_dir, depth=0):
    """Inline include('...') directives, resolving against base_dir then $TPTP."""
    if depth > 8:
        raise SyntaxError("include() nesting too deep")

    def repl(m):
        rel = m.group(1)
        for root in (base_dir, os.environ.get("TPTP")):
            if root:
                cand = os.path.join(root, rel)
                if os.path.exists(cand):
                    with open(cand) as f:
                        return expand_includes(f.read(), base_dir, depth + 1)
        raise SyntaxError(f"cannot resolve include({rel!r})")

    return _INCLUDE.sub(repl, strip_comments(text))


GOOD, BAD, UNSURE = "GOOD", "BAD", "UNSURE"

class ATP:
    BIN = os.environ.get("ATP_EPROVER_BIN", "eprover")
    PER_CALL = 10

    @staticmethod
    def _bin_path():
        candidate = ATP.BIN
        path = candidate if os.path.isabs(candidate) else shutil.which(candidate)
        if path and os.access(path, os.X_OK):
            return path
        import sys
        for base in (getattr(sys, '_MEIPASS', None),
                     os.path.dirname(os.path.abspath(sys.argv[0] or '.')),
                     os.path.dirname(os.path.abspath(__file__))):
            if base:
                cand = os.path.join(base, "eprover")
                if os.path.isfile(cand) and os.access(cand, os.X_OK):
                    return cand
        raise RuntimeError(
            f"external prover {ATP.BIN!r} is not available; "
            "install E or set ATP_EPROVER_BIN")

    @staticmethod
    def _run(problem, deadline):
        budget = min(ATP.PER_CALL, deadline.remaining() - 1.0)
        if budget < 1.0:
            raise OutOfTime()
        cpu = max(1, int(budget))
        with tempfile.NamedTemporaryFile('w', suffix='.p', delete=False) as fh:
            fh.write(problem); path = fh.name
        try:
            out = subprocess.run(
                [ATP._bin_path(), "--auto", "--silent", "-s", "--proof-object=0",
                 f"--cpu-limit={cpu}", path],
                capture_output=True, text=True, timeout=budget + 3).stdout
        except subprocess.TimeoutExpired:
            return "Timeout"
        finally:
            try: os.unlink(path)
            except OSError: pass
        m = re.search(r'SZS status (\w+)', out)
        return m.group(1) if m else "Unknown"

    @staticmethod
    def entails(premises, conclusion, deadline):
        """GOOD if premises |= conclusion, BAD if demonstrably not, else UNSURE."""
        ax = "\n".join(f"fof(p{i}, axiom, {pp(universal_closure(p.formula))})."
                       for i, p in enumerate(premises))
        goal = universal_closure(conclusion)
        pos = ATP._run(ax + f"\nfof(goal, conjecture, {pp(goal)}).", deadline)
        if pos in ("Theorem", "ContradictoryAxioms"):
            return GOOD, "ATP confirms premises entail the step"
        if pos == "CounterSatisfiable":
            return BAD, "ATP shows premises do NOT entail the step"
        neg = ATP._run(ax + f"\nfof(goal, conjecture, {pp(negate(goal))}).", deadline)
        if neg == "Theorem":
            return BAD, "ATP shows premises entail the NEGATION of the step"
        return UNSURE, "ATP could not confirm the step"

    @staticmethod
    def decide(formula, deadline):
        return ATP._run(f"fof(goal, conjecture, {pp(formula)}).", deadline)


def check_negated_conjecture(step, parents, deadline):
    statuses = step.statuses or {step.status}
    if any(x is not None for x in statuses) and not statuses & {'cth', 'esa'}:
        return BAD, f"negating the conjecture requires status cth, got {step.status}"
    if len(parents) != 1:
        return BAD, "negated_conjecture must have exactly one parent"
    parent = parents[0]
    if parent.role != 'conjecture':
        return BAD, f"negated_conjecture parent {parent.name} is not the conjecture"
    r = ATP.decide(Iff(universal_closure(step.formula),
                       negate(universal_closure(parent.formula))), deadline)
    if r == "Theorem":
        return GOOD, "formula is the correct negation of the conjecture"
    if r == "CounterSatisfiable":
        return BAD, "formula is NOT the negation of the conjecture"
    return UNSURE, "prover could not decide negation equivalence"

# two annotation dialects: skolemize(Var, Term) | skolemized(Var) ... bind(Var, Term)
_SK_NEW  = re.compile(r"new_symbols\(\s*skolem\s*,\s*\[([\w$,\s]+)\]\s*\)")
_SK_PAIR = re.compile(r"skolemi[sz]e\(\s*(\w+)\s*,\s*(.+?)\)\s*(?:,|$)")
_SK_VAR  = re.compile(r"skolemi[sz]ed\(\s*(\w+)\s*\)")
_SK_BIND = re.compile(r"bind\(\s*(\w+)\s*,\s*(.+?)\)\s*$")

def _skolem_annotation(annots):
    ns = _SK_NEW.search(annots)
    if not ns:
        return None
    new_syms = [s.strip() for s in ns.group(1).split(",") if s.strip()]
    rest = annots[:ns.start()] + annots[ns.end():]
    pm = _SK_PAIR.search(rest)
    if pm:
        return new_syms, pm.group(1), pm.group(2)
    vm = _SK_VAR.search(rest)
    bm = _SK_BIND.search(rest.strip())
    if vm and bm:
        if vm.group(1) != bm.group(1):
            return new_syms, None, None
        return new_syms, bm.group(1), bm.group(2)
    return None

def check_skolemize(step, parents, seen_symbols, deadline):
    if step.status != 'esa':
        return BAD, f"skolemize must have status esa, got {step.status}"
    if len(parents) != 1:
        return UNSURE, "expected exactly one parent"
    parent = parents[0].formula

    ann = _skolem_annotation(step.annots)
    if ann is None:
        return UNSURE, "skolemize annotations missing or not understood"
    new_syms, sk_var, term_text = ann
    if sk_var is None:
        return BAD, "skolemize annotations are inconsistent"
    if len(new_syms) != 1:
        return UNSURE, "multi-symbol skolemization not supported"
    new_sym = new_syms[0]
    if new_sym in seen_symbols:
        return BAD, f"Skolem symbol {new_sym} is not fresh (already in use)"

    scope, node = [], parent
    while True:
        if isinstance(node, Forall):
            scope.append(node.var); node = node.body
        elif isinstance(node, Exists):
            if node.var == sk_var:
                break
            return UNSURE, "existential nesting not handled; cannot check"
        else:
            return BAD, f"no existential {sk_var} at the expected position"

    try:
        bind_term = parse_term(term_text.strip())
    except SyntaxError:
        return UNSURE, "cannot parse skolem binding term"
    expected = Func(new_sym, tuple(Var(v) for v in scope))
    if bind_term != expected:
        return BAD, (f"Skolem term {pp_term(bind_term)} should be {pp_term(expected)} "
                     "(fresh symbol applied to exactly the universals in scope)")

    rebuilt = subst(node.body, {sk_var: bind_term})
    for v in reversed(scope):
        rebuilt = Forall(v, rebuilt)
    if equal_mod_alpha(rebuilt, step.formula):
        return GOOD, f"correct Skolemization introducing {pp_term(expected)}"
    return BAD, (f"Skolemization result is wrong; expected {pp(rebuilt)} "
                 f"but the step states {pp(step.formula)}")


def _sk_occurrences(f, sk):
    occs = []
    def t(x):
        if isinstance(x, Func):
            if x.name == sk:
                occs.append(x.args)
            for a in x.args: t(a)
    def go(g):
        if isinstance(g, Atom):
            for a in g.args: t(a)
        elif isinstance(g, Eq): t(g.lhs); t(g.rhs)
        elif isinstance(g, Not): go(g.sub)
        elif isinstance(g, (And, Or, Implies, Iff)): go(g.l); go(g.r)
        elif isinstance(g, (Forall, Exists)): go(g.body)
    go(f); return occs

def _replace_skterm(f, sk, args, var):
    target = Func(sk, args)
    def t(x):
        if x == target:
            return Var(var)
        if isinstance(x, Func):
            return Func(x.name, tuple(t(a) for a in x.args))
        return x
    def go(g):
        if isinstance(g, Atom): return Atom(g.pred, tuple(t(a) for a in g.args))
        if isinstance(g, Eq):   return Eq(t(g.lhs), t(g.rhs))
        if isinstance(g, Not):  return Not(go(g.sub))
        if isinstance(g, (And, Or, Implies, Iff)):
            return type(g)(go(g.l), go(g.r))
        if isinstance(g, (Forall, Exists)):
            return type(g)(g.var, go(g.body))
        return g
    return go(f)

def _binder_info(f):
    counts, above, kinds = {}, {}, {}
    def go(g, anc):
        if isinstance(g, (Forall, Exists)):
            counts[g.var] = counts.get(g.var, 0) + 1
            above.setdefault(g.var, set()).update(anc)
            kinds[g.var] = type(g)
            go(g.body, anc | {g.var})
        elif isinstance(g, Not): go(g.sub, anc)
        elif isinstance(g, (And, Or, Implies, Iff)): go(g.l, anc); go(g.r, anc)
    go(f, frozenset())
    return counts, above, kinds

def _insert_exists_inside(f, binder_var, ex_var):
    if isinstance(f, Forall) and f.var == binder_var:
        return Forall(f.var, Exists(ex_var, f.body))
    if isinstance(f, (Forall, Exists)):
        return type(f)(f.var, _insert_exists_inside(f.body, binder_var, ex_var))
    if isinstance(f, Not):
        return Not(_insert_exists_inside(f.sub, binder_var, ex_var))
    if isinstance(f, (And, Or, Implies, Iff)):
        return type(f)(_insert_exists_inside(f.l, binder_var, ex_var),
                       _insert_exists_inside(f.r, binder_var, ex_var))
    return f

def check_generic_skolemize(step, parents, seen_symbols, deadline):
    """Check an annotation-free skolemization: replace each fresh symbol's
    term sk(X1..Xn) by a new variable bound existentially just inside its
    innermost argument binder. The step formula is a correct skolemization
    of that reconstruction by construction, so the step is sound iff the
    premise entails the reconstruction."""
    if len(parents) != 1:
        return UNSURE, "expected exactly one parent"
    F = step.formula
    new_syms = sorted(func_symbols(F) - seen_symbols)

    for i, sk in enumerate(new_syms):
        occs = _sk_occurrences(F, sk)
        if not occs:
            continue
        args = occs[0]
        if any(o != args for o in occs):
            return UNSURE, f"skolem {sk} used with varying arguments"
        if not all(isinstance(a, Var) for a in args):
            return UNSURE, f"skolem {sk} applied to non-variable arguments"
        names = [a.name for a in args]
        if len(set(names)) != len(names):
            return UNSURE, f"skolem {sk} repeats an argument"
        counts, above, kinds = _binder_info(F)
        for n in names:
            if counts.get(n, 0) != 1:
                return UNSURE, f"argument {n} of skolem {sk} is not uniquely bound"
            if kinds[n] is not Forall:
                return UNSURE, f"argument {n} of skolem {sk} is not universal"
        v = f"_sk{i}"
        F = _replace_skterm(F, sk, args, v)
        if names:
            innermost = next((n for n in names
                              if set(names) - {n} <= above[n]), None)
            if innermost is None:
                return UNSURE, f"argument binders of skolem {sk} are not nested"
            F = _insert_exists_inside(F, innermost, v)
        else:
            F = Exists(v, F)

    if free_vars(F) != free_vars(step.formula):
        return UNSURE, "skolem occurrence escapes its quantifier scope"

    v, why = ATP.entails(parents, F, deadline)
    return v, {GOOD: "premise entails the de-skolemized formula",
               BAD: "premise does NOT entail the de-skolemized formula",
               UNSURE: "ATP could not confirm the de-skolemized formula"}[v]


def check_definition(step, seen_preds):
    """introduced(definition) must be a conservative extension:
    forall vars (newpred(vars) <=> body), newpred fresh, body over those vars."""
    core = strip_closure(step.formula)
    if not isinstance(core, Iff):
        return UNSURE, "introduced definition is not an equivalence"
    for lhs, body in ((core.l, core.r), (core.r, core.l)):
        if not isinstance(lhs, Atom):
            continue
        args = lhs.args
        if not all(isinstance(a, Var) for a in args):
            continue
        if len({a.name for a in args}) != len(args):
            return BAD, "defined atom repeats a variable"
        if lhs.pred in seen_preds:
            return BAD, f"defined predicate {lhs.pred} is not fresh"
        if lhs.pred in pred_symbols(body):
            return BAD, f"definition of {lhs.pred} is circular"
        if not free_vars(body) <= {a.name for a in args}:
            return BAD, "definition body uses variables not in the defined atom"
        return GOOD, f"conservative definition of {lhs.pred}"
    return UNSURE, "introduced definition has unexpected shape"


def check_proof(problem_steps, proof_steps, deadline=None, log_to=None):
    """Return (verdict, reason, log) with verdict VerifiedGood/VerifiedBad/Unknown."""
    deadline = deadline or Deadline()
    problem_by_name = {s.name: s for s in problem_steps}
    by_name = {}
    seen_symbols = set()
    seen_preds = set()
    for s in problem_steps:
        seen_symbols |= func_symbols(s.formula)
        seen_preds |= pred_symbols(s.formula)

    log = []
    first_bad = first_unsure = None
    has_false = False
    clausified = {}

    def record(step, kind, verdict, why):
        nonlocal first_bad, first_unsure
        log.append((step.name, kind, verdict, why))
        if log_to is not None:
            tag = {GOOD: "ok  ", BAD: "BAD ", UNSURE: "????"}[verdict]
            print(f"   [{tag}] {step.name:18s} {kind or '-':18s} {why}", file=log_to)
        if verdict == BAD and first_bad is None:
            first_bad = (step.name, why)
        if verdict == UNSURE and first_unsure is None:
            first_unsure = (step.name, why)

    if not proof_steps:
        return "VerifiedBad", "proof contains no formulae", log

    for s in proof_steps:
        deadline.check()
        if s.name in by_name:
            record(s, "structure", BAD, "duplicate step name")
            by_name[s.name] = s
            continue

        if s.source_kind == 'inference':
            missing = [p for p in s.premises
                       if p not in by_name and p not in problem_by_name]
            if s.opaque_premises:
                record(s, s.rule, UNSURE, "premise list not understood")
            elif missing:
                record(s, s.rule, BAD,
                       f"premise(s) {missing} not defined before this step")
            else:
                parents = [by_name.get(p) or problem_by_name[p]
                           for p in s.premises]
                used_conj = [p.name for p in parents if p.role == 'conjecture']
                statuses = s.statuses or frozenset({s.status})
                if s.rule == 'negated_conjecture' or (
                        used_conj and (statuses & {'cth', 'esa'}
                                       or statuses <= {None})):
                    # must be the negation of the conjecture, or a skolemized
                    # form of it for esa/unlabelled chains
                    v, why = check_negated_conjecture(s, parents, deadline)
                    if v != GOOD and len(parents) == 1 and (
                            'esa' in statuses or statuses <= {None}):
                        target = negate(universal_closure(parents[0].formula))
                        v2, why2 = check_generic_skolemize(
                            s, [Step(parents[0].name, 'plain', target)],
                            seen_symbols, deadline)
                        if v2 == GOOD:
                            v, why = GOOD, ("skolemized negation of the "
                                            f"conjecture: {why2}")
                        elif v == BAD:
                            v, why = UNSURE, (f"{why} (nor confirmed as a "
                                              "skolemized negation)")
                    record(s, s.rule, v, why)
                elif used_conj:
                    record(s, s.rule, BAD,
                           f"conjecture {used_conj[0]} used as a premise "
                           "(only a negation of the conjecture may consume it)")
                elif 'esa' in statuses or s.rule in ('skolemize', 'skolemise'):
                    v = why = None
                    if _skolem_annotation(s.annots) is not None:
                        v, why = check_skolemize(s, parents, seen_symbols,
                                                 deadline)
                    if v is None or v == UNSURE:
                        v2, why2 = check_generic_skolemize(
                            s, parents, seen_symbols, deadline)
                        if v is None or v2 != UNSURE:
                            v, why = v2, why2
                    record(s, s.rule, v, why)
                elif statuses <= {'thm'}:
                    v, why = ATP.entails(parents, s.formula, deadline)
                    record(s, s.rule, v, why)
                elif statuses <= {None}:
                    # no status given (e.g. Vampire): verify semantically, but
                    # a failed check is Unknown since the claimed semantics is
                    # unknown - the step may be a legal splitting/esa step
                    v, why = ATP.entails(parents, s.formula, deadline)
                    if v != GOOD and func_symbols(s.formula) - seen_symbols:
                        v2, why2 = check_generic_skolemize(
                            s, parents, seen_symbols, deadline)
                        if v2 == GOOD:
                            v, why = v2, why2
                    if v != GOOD:
                        v, why = UNSURE, ("unlabelled step could not be "
                                          "confirmed as consequence or "
                                          "skolemization")
                    record(s, s.rule, v, why)
                else:
                    record(s, s.rule, UNSURE,
                           f"rule {s.rule} with status(es) "
                           f"{sorted(x or '?' for x in statuses)} not checkable")
        elif s.source_kind == 'introduced':
            if s.rule == 'definition':
                v, why = check_definition(s, seen_preds)
                record(s, "definition", v, why)
            else:
                record(s, "introduced", UNSURE,
                       f"introduced({s.rule}) not checkable")
        else:
            def backs(p):
                return ((s.role == 'conjecture') == (p.role == 'conjecture')
                        and same_formula(p.formula, s.formula))
            ref = s.file_ref or s.name
            origin = None
            if s.source_kind == 'copy':
                prev = by_name.get(ref)
                if prev is not None and prev.role != 'conjecture' \
                        and same_formula(prev.formula, s.formula):
                    origin = prev
            if origin is None:
                origin = problem_by_name.get(ref)
                if origin is None or not backs(origin):
                    origin = next((p for p in problem_steps if backs(p)), None)
            if origin is not None:
                record(s, "input", GOOD, f"matches formula {origin.name!r}")
            else:
                # not a verbatim copy; some systems emit pre-clausified inputs
                # as file() leaves. Clauses of one source formula share skolem
                # symbols, so conjoin the open bodies of the skolem-connected
                # clauses under a single closure (universals merge: forall X p
                # & forall X q = forall X (p & q)) and check the result as a
                # skolemized consequence of the named formula.
                named = problem_by_name.get(ref) if s.file_ref else None
                fresh = func_symbols(s.formula) - seen_symbols
                if named is not None and (named.role == 'conjecture') \
                        == (s.role == 'negated_conjecture'):
                    target = negate(universal_closure(named.formula)) \
                        if named.role == 'conjecture' else named.formula
                    prior = clausified.get(ref, [])
                    all_prior_syms = set().union(set(), *[ps for _, ps in prior])
                    body = strip_closure(s.formula)
                    inc_syms = set(func_symbols(body))
                    included, changed = [], True
                    while changed:
                        changed = False
                        for pb, ps in prior:
                            if id(pb) not in included and ps & inc_syms:
                                body = And(body, pb)
                                inc_syms |= ps | func_symbols(pb)
                                included.append(id(pb))
                                changed = True
                    probe = Step(s.name, s.role, universal_closure(body))
                    v, why = check_generic_skolemize(
                        probe, [Step(named.name, 'plain', target)],
                        seen_symbols - all_prior_syms, deadline)
                    if v == BAD and included:
                        # multi-clause reconstruction is heuristic; a failed
                        # joint check does not prove the leaf is flawed
                        v, why = UNSURE, f"joint clausification unconfirmed: {why}"
                    record(s, "input", v,
                           f"as clausified form of {named.name!r}: {why}")
                    if v == GOOD:
                        own = func_symbols(s.formula) - (seen_symbols
                                                         - all_prior_syms)
                        clausified[ref] = prior + [(strip_closure(s.formula),
                                                    own)]
                elif fresh:
                    record(s, "input", UNSURE,
                           f"input {s.name} not found in the problem "
                           "(unrecognised clausified form?)")
                else:
                    record(s, "input", BAD,
                           f"input {s.name} ({s.role}) does not occur "
                           "in the problem")

        if s.formula == Atom('$false'):
            has_false = True
        seen_symbols |= func_symbols(s.formula)
        seen_preds |= pred_symbols(s.formula)
        by_name[s.name] = s
        if first_bad:
            break

    if first_bad:
        return "VerifiedBad", f"step {first_bad[0]}: {first_bad[1]}", log
    if not has_false:
        return "VerifiedBad", "refutation never derives $false", log
    if first_unsure:
        return "Unknown", f"step {first_unsure[0]}: {first_unsure[1]}", log
    return "VerifiedGood", "all steps verified", log


def verify(problem_text, proof_text, deadline=None, log_to=None, problem_dir=None):
    deadline = deadline or Deadline()
    try:
        problem_steps = parse_tstp(expand_includes(problem_text, problem_dir), deadline)
        proof_steps = parse_tstp(proof_text, deadline)
    except OutOfTime:
        raise
    except (SyntaxError, RecursionError) as e:
        return "Unknown", f"parse error: {e}", []
    return check_proof(problem_steps, proof_steps, deadline, log_to)
