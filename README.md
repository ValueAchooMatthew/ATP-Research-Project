# ProofGuard

ProofGuard is an independent checker for machine-generated proofs. It takes a
first-order logic problem and a proof of it written in the
[TSTP format](https://tptp.org/UserDocs/QuickGuide/Derivations.html), and
decides whether the proof actually proves the theorem. I built it for
[ProoVer 2026](https://proover-competition.github.io/competitions/2026/), the
first international competition for proof checkers, where it placed 5th of 8
in the regular division. A paper about the system and what the competition
revealed about it is in progress with Alicia Marinache (McMaster University).

## Why this matters

Automated theorem provers, and increasingly AI systems, output proofs rather
than just answers. A proof is only useful if something independent of the
system that produced it can confirm that every step holds. As Geoff Sutcliffe
puts it, provers are "complex pieces of software, and thus may have bugs that
make them unsound", and checking their implementations directly is impractical,
so the proofs they output are checked instead
([Sutcliffe, 2006](https://www.cs.miami.edu/home/geoff/Papers/Journal/2006_Sut06_IJAIT-TBA.pdf)).
The same problem now shows up with large language models, which produce
convincing proofs that cite the wrong facts or claim steps that do not follow.

ProofGuard checks a proof one step at a time. Steps copied from the problem
file are compared against it, the negated conjecture and Skolemization steps
are rebuilt and compared structurally, and every other step is handed to the
E prover as a small local problem: do these premises imply this formula? The
checker never tries to prove the original theorem itself. It reports one of
four verdicts, `VerifiedGood`, `VerifiedBad`, `Unknown`, or `Timeout`, and it
is built to say `Unknown` rather than guess. The whole system is about a
thousand lines of Python with no dependencies beyond E.

## Competition results

ProoVer 2026 ran on 27 July 2026 at IJCAR, part of FLoC 2026 in Lisbon. Each
checker had 30 seconds per proof on 91 proofs, 47 of them deliberately broken.
Scoring was +2 for rejecting a bad proof, +1 for accepting a good one, -1 for
rejecting a good one, and -10 for accepting a bad one.

| System | Score | Bad as bad | Good as good | Gave up | Good as bad | Bad as good |
|---|---:|---:|---:|---:|---:|---:|
| GAPT 2.20 | 111 | 41 | 34 | 11 | 5 | 0 |
| VaLeaDate 0.1 | 98 | 46 | 24 | 3 | 18 | 0 |
| Nörgler 1.1 | 93 | 46 | 27 | 1 | 16 | 1 |
| ProofCheck 1.0 | 75 | 42 | 31 | 5 | 10 | 3 |
| **ProofGuard 1.0** | **49** | **40** | **30** | **5** | **11** | **5** |
| mrs-proover 0.2.0 | 47 | 39 | 31 | 4 | 12 | 5 |
| PyCheck 0.1 | 41 | 28 | 37 | 19 | 2 | 5 |
| CheckProof 0.1 | -103 | 25 | 28 | 10 | 11 | 17 |

Source: the [official results page](https://tptp.org/CASC/J13/WWWFiles/Results.html#PRVProblems)
(the per-proof outputs for every system are linked from it). The field included
entries from TU Wien, the University of Greifswald, and E's author Stephan
Schulz. See also the
[ProoVer 2026 proceedings](https://proover-competition.github.io/assets/ProoVer2026_proceedings.pdf),
which contain every system's description, the
[competition system descriptions](https://tptp.org/CASC/J13/SystemDescriptions.html#ProofGuard---1.0),
and the [full problem set](https://proover-competition.github.io/assets/ProoVer2026.zip).
My submitted system description is in this repository as
[proof-guard-system-description.pdf](proof-guard-system-description.pdf).

ProofGuard correctly rejected 40 of the 47 bad proofs, correctly accepted 30
of the 44 good ones, and averaged 1.92 seconds per proof. Its five false
acceptances cost 50 points, which is the gap between 5th place and 2nd.

### What went wrong, and why it is the interesting part

I downloaded the published problem set after the competition, re-ran the exact
submitted package, and reproduced 89 of the 91 official verdicts (the other two
were timeouts on the slower competition hardware). Every misclassification
traces to a specific decision in the code.

All five accepted bad proofs were logically sound. They were bad because they
broke the competition's certificate rules: an axiom step that cited one formula
but stated another, Skolemization steps missing a mandatory annotation, and a
Skolemization step that falsely claimed to be a logical consequence. Four of
the five slipped through fallbacks I had added so ProofGuard could handle the
messy output of real provers like E and SNARK. Those fallbacks confirmed that
each step was *sound*, which is not the same as confirming it was *what it
claimed to be*. Two of those five proofs fooled five and six of the ten
competing systems respectively, including Geoff Sutcliffe's own GDV.

All eleven rejected good proofs were the opposite error: the checker returned
`VerifiedBad` for constructions it did not handle (Skolem arguments in an
unexpected order, forward references the rules allow, an existential hidden
under a negation) instead of returning `Unknown` as its own policy required.

The lesson, which the paper is built around, is that a checker can only be as
conservative as the specification it measures itself against. ProofGuard was
conservative about logical soundness and not about the certificate format, and
every point it lost came from exactly that gap. Had those 16 proofs been
reported as `Unknown`, the score would have been 110, one point behind the
winner.

### Testing before the competition

- 22/22 cases on the official examples plus hand-written adversarial proofs
- 15/15 proofs generated by E on TPTP problems verified
- 58 real proofs from five different provers (E, Vampire, SNARK, Prover9,
  Drodi): 15 verified, 43 `Unknown`, 0 false rejections
- 45/45 mutated proofs correctly never accepted

None of this caught the competition failures, because every test corpus was
either real prover output (which rewards leniency) or a semantic mutation
(which never breaks an annotation). That gap in the testing is itself one of
the paper's findings.

## The paper

**ProofGuard: A Conservative Checker for TSTP Refutation Proofs**, with Alicia
Marinache (McMaster University). Drafted in Overleaf.

Current state (October 2026): the literature survey, the description of the
system, and the verification strategy are written. The introduction is in
progress. The decision policy, implementation, evaluation, and future work
sections exist as detailed notes and are being written up in that order. The
evaluation will present the competition results and the failure analysis
above as a reproducible negative result, and the future work covers a strict
conformance mode, auditing every `VerifiedBad` against the decision policy, and
specification-level mutation testing.

Venues under consideration are an arXiv preprint, the Journal of Open Source
Software, and the next editions of the CADE system description track, AITP,
and the NeurIPS MATH-AI workshop.

## Usage and development

The sections below are the technical documentation for running, building,
and testing the checker.

### Launch command

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

### How it verifies

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

### Docker

```
docker build -t atp-proover .
docker run --rm -v "$PWD:/data" atp-proover /data/problem.p /data/proof.s
```

The image bundles a freshly built E prover, so it runs without network access.

### Competition delivery bundle

```
./build-delivery.sh          # writes delivery/proover-delivery-<date>.tar.gz
```

Builds a self-contained bundle for the competition's CentOS 7.4 servers
(glibc 2.17): E compiled in a manylinux2014 container, a portable CPython
runtime, and the verifier. Verified to run on a stock `centos:7` image with
no network. This tarball plus the launch command in its README.txt is what
gets emailed to the organizers.

### Tests

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

### Repository layout

- `proover.py` — the engine: TSTP/FOF parser, formula algebra, step checkers,
  deadline-aware E invocation.
- `proover-check` — competition entry point (one SZS line, timeout guard).
- `tests/run_tests.py` — test suite.
- `Dockerfile` — self-contained image with E bundled.

Please note that AI was used in part to help with the coding and documenting of this project.