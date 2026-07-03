#!/usr/bin/env python3
"""Round-trip bench: E proves each problem in tests/tptp/, then the verifier
checks E's proof. E's proofs are correct, so VerifiedBad is a soundness bug
and fails loudly; the baseline catches Good -> Unknown coverage regressions.

Usage:
    python3 tests/tptp_bench.py                 # compare against the baseline
    python3 tests/tptp_bench.py --update        # (re)write the baseline
    python3 tests/tptp_bench.py --dir DIR ...   # bench extra problem dirs
"""
import os, re, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
CLI = os.path.join(ROOT, "proover-check")
BASELINE = os.path.join(HERE, "tptp_baseline.txt")
EPROVER = os.environ.get("ATP_EPROVER_BIN", "eprover")
E_CPU = 10


def eprove(problem):
    """Run E; return (szs_status, proof_text or None)."""
    out = subprocess.run(
        [EPROVER, "--auto", "--proof-object", f"--cpu-limit={E_CPU}", problem],
        capture_output=True, text=True, timeout=E_CPU + 15).stdout
    m = re.search(r"SZS status (\w+)", out)
    status = m.group(1) if m else "Unknown"
    return status, out if status in ("Theorem", "Unsatisfiable") else None


def check(problem, proof_path):
    out = subprocess.run(
        [sys.executable, CLI, "--quiet", problem, proof_path],
        capture_output=True, text=True, timeout=45).stdout
    for line in out.splitlines():
        if line.startswith("% SZS status "):
            return line[len("% SZS status "):].split(" : ")[0].strip()
    return "<no status>"


def bench(dirs):
    results = {}
    for d in dirs:
        for name in sorted(os.listdir(d)):
            if not name.endswith(".p"):
                continue
            path = os.path.join(d, name)
            try:
                status, proof = eprove(path)
            except subprocess.TimeoutExpired:
                status, proof = "Timeout", None
            if proof is None:
                print(f"  [skip] {name:16s} E: {status}")
                continue
            with tempfile.NamedTemporaryFile("w", suffix=".s", delete=False) as f:
                f.write(proof)
                proof_path = f.name
            try:
                verdict = check(path, proof_path)
            finally:
                os.unlink(proof_path)
            results[name] = verdict
            flag = "!! FALSE POSITIVE" if verdict == "VerifiedBad" else ""
            print(f"  [{'ok' if not flag else 'XX'}]   {name:16s} E: {status:13s} -> {verdict} {flag}")
    return results


def main():
    args = sys.argv[1:]
    update = "--update" in args
    dirs = [os.path.join(HERE, "tptp")]
    while "--dir" in args:
        i = args.index("--dir")
        dirs.append(args[i + 1])
        del args[i:i + 2]

    results = bench(dirs)
    bad = [n for n, v in results.items() if v == "VerifiedBad"]

    if update:
        with open(BASELINE, "w") as f:
            f.write("# problem -> verifier verdict on an E-generated proof\n")
            for n, v in sorted(results.items()):
                f.write(f"{n} {v}\n")
        print(f"\nbaseline written: {BASELINE} ({len(results)} entries)")
        return 1 if bad else 0

    failures = list(bad)
    if os.path.exists(BASELINE):
        base = {}
        with open(BASELINE) as f:
            for line in f:
                if line.strip() and not line.startswith("#"):
                    n, v = line.split()
                    base[n] = v
        for n, want in sorted(base.items()):
            got = results.get(n)
            if got is None:
                print(f"  [warn] {n}: no result this run (E gave up?)")
            elif got != want:
                regression = (want == "VerifiedGood") or (got == "VerifiedBad")
                print(f"  [{'FAIL' if regression else 'note'}] {n}: {want} -> {got}")
                if regression:
                    failures.append(n)
    else:
        print("\nno baseline yet; run with --update to record one")

    good = sum(1 for v in results.values() if v == "VerifiedGood")
    print(f"\n{good}/{len(results)} VerifiedGood, "
          f"{sum(1 for v in results.values() if v == 'Unknown')} Unknown, "
          f"{len(bad)} VerifiedBad")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
