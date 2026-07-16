# ProoVer verifier

A semantic proof verifier for TSTP refutation proofs of FOF problems, built for
the [ProoVer 2026 competition](https://proover-competition.github.io/).

## Launch command

```
./proover-check [--time-limit SECONDS] [--quiet] PROOF
```

Prints exactly one line to stdout:

```
% SZS status VerifiedGood | VerifiedBad [: reason] | Unknown [: reason] | Timeout
```

The problem file is located from the proof itself, via its `file('...')`
directives and its `% Proof : <path>` header, tried relative to the working
directory and to the proof's own directory. A two-argument form
(`./proover-check PROBLEM PROOF`) naming the problem explicitly is also
accepted. Step-by-step details go to stderr (suppress with `--quiet`). The
wall-clock budget defaults to 30 seconds (`--time-limit` or
`PROOVER_TIME_LIMIT` override it); the verifier emits `Timeout` itself before
the budget runs out.

Requires Python 3.8+ and the E prover (`eprover` on PATH, or point
`ATP_EPROVER_BIN` at a binary).

## How it verifies

- **Input steps** (`file(...)` sources) must match a problem formula up to
  variable renaming, with the same conjecture-ness. Fabricated or tampered
  axioms are rejected.
- **negated_conjecture** steps (status `cth`) must be logically equivalent to
  the negation of the problem's conjecture, and only such steps may consume
  the conjecture.
- **skolemize** steps (status `esa`) are checked syntactically: the Skolem
  symbol must be fresh across everything seen so far, and the binding term
  must apply it to exactly the universals in scope of the named existential.
  Both annotation dialects (`skolemize(V, t)` and `skolemized(V) ... bind(V, t)`)
  are supported. Annotation-free skolemization chains (as E emits) are
  checked by de-skolemizing the step - each fresh symbol's term becomes an
  existential re-inserted inside its innermost argument binder - which makes
  the step a correct skolemization of the result by construction; the
  remaining thm-content is then checked with the ATP.
- **All other steps with status `thm`** are checked by calling E on that step
  and its premises only, as the competition rules require; the conjecture is
  never re-proved independently. E showing the step countersatisfiable yields
  a definite `VerifiedBad`.
- **Structural soundness**: premises must be defined before use (no circular
  or forward references), step names must be unique, and the proof must
  actually derive `$false`.
- Nested E-style inference chains (`inference(..., [inference(...)])`) are
  flattened, so unmodified `eprover --proof-object` output verifies too.

Anything the verifier cannot decide is reported as `Unknown`, never guessed.

## Docker

```
docker build -t atp-proover .
docker run --rm -v "$PWD:/data" atp-proover /data/problem.p /data/proof.s
```

The image bundles a freshly built E prover, so it runs without network access.

## Competition delivery bundle

```
./build-delivery.sh          # writes delivery/proover-delivery-<date>.tar.gz
```

Builds a self-contained bundle for the competition's CentOS 7.4 servers
(glibc 2.17): E compiled in a manylinux2014 container, a portable CPython
runtime, and the verifier. Verified to run on a stock `centos:7` image with
no network. This tarball plus the launch command in its README.txt is what
gets emailed to the organizers.

## Tests

```
python3 tests/run_tests.py            # official example corpus + adversarial cases
python3 tests/tptp_bench.py           # TPTP round-trip bench against the baseline
python3 tests/tptp_bench.py --update  # re-record tests/tptp_baseline.txt
```

The TPTP bench has E prove each problem in `tests/tptp/` (E's example set,
spanning 18 TPTP domains, FOF and CNF, several with `include()` axiom files),
then verifies E's own proof. Correct proofs must never come back
`VerifiedBad`; the baseline records which come back `VerifiedGood` versus a
conservative `Unknown` so soundness and coverage regressions both fail the
bench. Extra problem directories can be added with `--dir DIR`.

```
python3 tests/fetch_tstp.py           # (re)harvest the TSTP sample corpus
python3 tests/tstp_check.py           # verify TSTP solutions vs baseline
python3 tests/fuzz_mutations.py       # mutation fuzzer (soundness)
```

`tests/tstp/` caches a sample of real solutions from the TSTP library across
five ATP systems (E, Vampire, SNARK, Prover9, Drodi) and ten problem domains
- proof dialects we did not develop against. All are presumed-correct proofs,
so any `VerifiedBad` fails the suite as a soundness bug. The mutation fuzzer
guards the opposite direction: it corrupts known-correct proofs (tampered
leaves, orphaned negations, circular premises) and asserts the verifier never
answers `VerifiedGood`. Together these keep dialect-coverage work from
drifting into accepting too much.

`tests/examples/` holds the official ProoVer 2026 examples (correct proofs
COR*, evil proofs EVL*, and the 8 MB TMO000 stress proof — which hides a real
flaw at step sk219 that this verifier finds in ~12 s).

`Problems/`/`Proofs/` keep an early hand-written example whose proof is in
fact unsound (its conjecture `![X]: p(X)` does not follow from `p(a)`); the
verifier correctly reports `VerifiedBad` where a purely structural check
would accept it.

## Repository layout

- `proover.py` — the engine: TSTP/FOF parser, formula algebra, step checkers,
  deadline-aware E invocation.
- `proover-check` — competition entry point (one SZS line, timeout guard).
- `tests/run_tests.py` — test suite.
- `Dockerfile` — self-contained image with E bundled.

Please note that AI was used in part to help with the coding and documenting of this project.