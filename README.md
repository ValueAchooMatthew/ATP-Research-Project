# 🛡️ ProofGuard

An independent checker for machine-generated proofs. Give it a first-order
logic problem and a proof in the [TSTP format](https://tptp.org/UserDocs/QuickGuide/Derivations.html),
and it tells you whether the proof holds.

- 🏆 Built for [ProoVer 2026](https://proover-competition.github.io/competitions/2026/),
  the first international competition for proof checkers (IJCAR, FLoC 2026, Lisbon).
  Placed **5th of 10**.
- 📄 Paper in progress with Alicia Marinache (McMaster University).
- 🐍 About 1,000 lines of Python. No dependencies beyond the E prover.

## 🧭 Why it matters

- Theorem provers, and now AI systems, output proofs. Those proofs need to be
  checked by something independent of whatever produced them.
- Provers are "complex pieces of software, and thus may have bugs that make
  them unsound" ([Sutcliffe, 2006](https://www.cs.miami.edu/home/geoff/Papers/Journal/2006_Sut06_IJAIT-TBA.pdf)).
  LLMs write convincing proofs that cite the wrong facts.
- ProofGuard checks every step on its own, never re-proves the theorem, and
  answers `Unknown` instead of guessing.

## 🏁 Results

ProoVer 2026, 27 July 2026. 91 proofs, 47 of them deliberately broken, 30
seconds each. Scoring: +2 reject a bad proof, +1 accept a good one, -1 reject
a good one, -10 accept a bad one.

| System | Score | Bad proofs accepted |
|---|---:|---:|
| GAPT 2.20 (TU Wien) | 111 | 0 |
| VaLeaDate 0.1 (TU Wien) | 98 | 0 |
| Nörgler 1.1 (Greifswald) | 93 | 1 |
| ProofCheck 1.0 | 75 | 3 |
| **ProofGuard 1.0** | **49** | **5** |
| mrs-proover 0.2.0 | 47 | 5 |
| PyCheck 0.1 (Stephan Schulz, author of E) | 41 | 5 |
| CheckProof 0.1 | -103 | 17 |
| GDV 2.0 (Geoff Sutcliffe, demo division) | -4 | 5 |
| GDV-LP 2.0 (demo division) | -6 | 5 |

ProofGuard on the 91 proofs:

- ✅ 40 of 47 bad proofs rejected
- ✅ 30 of 44 good proofs accepted
- ❌ 11 good proofs rejected (-11)
- ❌ 5 bad proofs accepted (-50)
- ⚡ 1.92 seconds per proof on average

🔗 [Official results](https://tptp.org/CASC/J13/WWWFiles/Results.html#PRVProblems) ·
[Proceedings](https://proover-competition.github.io/assets/ProoVer2026_proceedings.pdf) ·
[System descriptions](https://tptp.org/CASC/J13/SystemDescriptions.html#ProofGuard---1.0) ·
[Problem set](https://proover-competition.github.io/assets/ProoVer2026.zip) ·
[My system description (PDF)](proof-guard-system-description.pdf)

## 🔍 Failure analysis

I re-ran the exact submitted package on the published problem set and
reproduced 89 of the 91 official verdicts. Every error traces to a specific
decision in the code.

- 🔴 **5 bad proofs accepted.** All five were logically sound. They broke the
  competition's certificate rules instead: an axiom step citing one formula but
  stating another, Skolemization steps missing a required annotation, a step
  falsely claiming to be a logical consequence. Four came from fallbacks I
  added so ProofGuard could handle messy real-world prover output. Two of
  these proofs also fooled 5 and 6 of the 10 competing systems, including
  Sutcliffe's own GDV.
- 🟠 **11 good proofs rejected.** The checker answered `VerifiedBad` for
  constructions it did not handle, where its own policy called for `Unknown`.
- 📊 **Had those 16 been reported as `Unknown`, the score would have been 110,**
  one point behind the winner.
- 🧪 **Pre-competition testing missed all of it.** 22/22 example cases, 15/15
  E-generated proofs, 58 real proofs from five provers with 0 false rejections,
  45/45 mutated proofs never accepted. None of these tests ever broke a
  certificate annotation.

Takeaway: ProofGuard was conservative about logical soundness. The competition
graded conformance to the certificate specification. The paper is built
around that gap.

## 📝 Paper

**ProofGuard: A Conservative Checker for TSTP Refutation Proofs**, with Alicia
Marinache (McMaster University). Drafted in Overleaf. Status as of October 2026:

- ✅ Written: literature survey, system model, verification strategy
- ✍️ In progress: introduction
- 🗒️ Detailed notes, being written up next: decision policy, implementation,
  evaluation (the failure analysis above as a reproducible result), future work
- 🎯 Venues under consideration: arXiv preprint, Journal of Open Source
  Software, and the next editions of the CADE system description track, AITP,
  and the NeurIPS MATH-AI workshop

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