#!/usr/bin/env python3
"""Verify the cached TSTP solution corpus (tests/tstp/, from fetch_tstp.py).
All solutions are real ATP proofs, so VerifiedBad is a soundness bug and
fails loudly; the baseline catches Good -> Unknown coverage regressions.

Usage:
    python3 tests/tstp_check.py             # compare against the baseline
    python3 tests/tstp_check.py --update    # (re)write the baseline
"""
import os, subprocess, sys, collections

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
CLI = os.path.join(ROOT, "proover-check")
CORPUS = os.path.join(HERE, "tstp")
BASELINE = os.path.join(HERE, "tstp_baseline.txt")


def check(problem, proof):
    out = subprocess.run(
        [sys.executable, CLI, "--quiet", problem, proof],
        capture_output=True, text=True, timeout=45).stdout
    for line in out.splitlines():
        if line.startswith("% SZS status "):
            return line[len("% SZS status "):].split(" : ")[0].strip()
    return "<no status>"


def main():
    update = "--update" in sys.argv
    if not os.path.isdir(CORPUS):
        print("no tests/tstp corpus; run tests/fetch_tstp.py first")
        return 1

    results = {}
    per_system = collections.Counter()
    per_system_good = collections.Counter()
    for name in sorted(os.listdir(CORPUS)):
        if not name.endswith(".s"):
            continue
        prob = name.split(".")[0] + ".p"
        ppath = os.path.join(CORPUS, prob)
        if not os.path.exists(ppath):
            continue
        system = name.split(".")[1].split("---")[0]
        try:
            verdict = check(ppath, os.path.join(CORPUS, name))
        except subprocess.TimeoutExpired:
            verdict = "Timeout"
        results[name] = verdict
        per_system[system] += 1
        if verdict == "VerifiedGood":
            per_system_good[system] += 1
        flag = "!! FALSE POSITIVE" if verdict == "VerifiedBad" else ""
        print(f"  [{'XX' if flag else 'ok'}] {name:44s} -> {verdict} {flag}")

    bad = [n for n, v in results.items() if v == "VerifiedBad"]
    print("\nby system: " + ", ".join(
        f"{s} {per_system_good[s]}/{per_system[s]}" for s in sorted(per_system)))
    good = sum(1 for v in results.values() if v == "VerifiedGood")
    print(f"total: {good}/{len(results)} VerifiedGood, "
          f"{sum(1 for v in results.values() if v == 'Unknown')} Unknown, "
          f"{len(bad)} VerifiedBad")

    if update:
        with open(BASELINE, "w") as f:
            f.write("# solution -> verifier verdict (correct proofs; Bad = soundness bug)\n")
            for n, v in sorted(results.items()):
                f.write(f"{n} {v}\n")
        print(f"baseline written: {BASELINE}")
        return 1 if bad else 0

    failures = list(bad)
    if os.path.exists(BASELINE):
        base = {}
        with open(BASELINE) as f:
            for line in f:
                if line.strip() and not line.startswith("#"):
                    n, v = line.rsplit(None, 1)
                    base[n] = v
        for n, want in sorted(base.items()):
            got = results.get(n)
            if got is not None and got != want:
                regression = (want == "VerifiedGood") or (got == "VerifiedBad")
                print(f"  [{'FAIL' if regression else 'note'}] {n}: {want} -> {got}")
                if regression:
                    failures.append(n)
    else:
        print("no baseline yet; run with --update to record one")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
