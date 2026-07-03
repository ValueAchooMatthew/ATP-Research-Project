#!/usr/bin/env python3
"""Harvest a small sample of TSTP solutions into tests/tstp/ via the
tptp.org CGI, for tests/tstp_check.py. Sequential with a delay to be polite
to the server; re-running only fetches what is missing.

Usage: python3 tests/fetch_tstp.py
"""
import html, os, re, sys, time, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "tstp")
CGI = "https://tptp.org/cgi-bin/SeeTPTP"
DELAY = 0.7          # seconds between requests
UA = {"User-Agent": "proover-verifier-bench (research; matthewtamerfarah@gmail.com)"}

DOMAINS = ["PUZ", "SYN", "GRP", "SET", "NUM", "GEO", "LCL", "MGT", "KRS", "AGT"]
PER_DOMAIN = 2
SYSTEMS = ["Vampire---", "E---", "SNARK---", "Drodi---", "Zipperpin---",
           "Prover9---", "iProver---", "leanCoP---"]   # in preference order
MAX_SYSTEMS = 3
SOLUTION_KINDS = (".THM-Ref.s", ".THM-CRf.s", ".THM-Prf.s")


def get(url):
    time.sleep(DELAY)
    with urllib.request.urlopen(urllib.request.Request(url, headers=UA),
                                timeout=30) as r:
        return r.read().decode("iso-8859-1", "replace")


def get_pre(url):
    "Return a CGI page's <pre> payload with HTML tags and entities removed."
    page = get(url)
    m = re.search(r"<pre>(.*)</pre>", page, re.DOTALL | re.IGNORECASE)
    if not m:
        return None
    return html.unescape(re.sub(r"<[^>]+>", "", m.group(1)))


def fetch_axioms(problem_text):
    for ax in re.findall(r"include\('([^']+)'", problem_text):
        dest = os.path.join(OUT, ax)
        if os.path.exists(dest):
            continue
        name = os.path.basename(ax)
        text = get_pre(f"{CGI}?Category=Axioms&File={name}")
        if text is None:
            print(f"    !! axiom {name} not fetched")
            continue
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        with open(dest, "w") as f:
            f.write(text)
        print(f"    axiom {name}")


def main():
    os.makedirs(OUT, exist_ok=True)
    for dom in DOMAINS:
        listing = get(f"{CGI}?Category=Solutions&Domain={dom}")
        files = []
        for f in re.findall(r"File=([A-Z]{3}\d{3}\+\d+)\b", listing):
            if f not in files:
                files.append(f)
        print(f"{dom}: {len(files)} FOF problems listed")
        picked = 0
        for prob in files:
            if picked >= PER_DOMAIN:
                break
            sols = get(f"{CGI}?Category=Solutions&Domain={dom}&File={prob}")
            names = set(re.findall(r"System=([A-Za-z0-9_.+-]+\.s)\b", sols))
            chosen = []
            for prefix in SYSTEMS:
                if len(chosen) >= MAX_SYSTEMS:
                    break
                for kind in SOLUTION_KINDS:
                    cand = sorted(n for n in names
                                  if n.startswith(prefix) and n.endswith(kind))
                    if cand:
                        chosen.append(cand[-1])
                        break
            if not chosen:
                continue

            ppath = os.path.join(OUT, f"{prob}.p")
            if not os.path.exists(ppath):
                ptext = get_pre(f"{CGI}?Category=Problems&Domain={dom}&File={prob}.p")
                if ptext is None:
                    print(f"  {prob}: problem not fetched, skipping")
                    continue
                with open(ppath, "w") as f:
                    f.write(ptext)
                fetch_axioms(ptext)
            got = 0
            for system in chosen:
                spath = os.path.join(OUT, f"{prob}.{system}")
                if os.path.exists(spath):
                    got += 1
                    continue
                stext = get_pre(f"{CGI}?Category=Solutions&Domain={dom}"
                                f"&File={prob}&System={system}")
                if stext is None or "fof(" not in stext and "cnf(" not in stext:
                    continue
                with open(spath, "w") as f:
                    f.write(stext)
                got += 1
            print(f"  {prob}: {got} solutions ({', '.join(c.split('---')[0] for c in chosen)})")
            if got:
                picked += 1
    total = len([f for f in os.listdir(OUT) if f.endswith(".s")])
    print(f"\ncorpus: {total} solutions in {OUT}")


if __name__ == "__main__":
    sys.exit(main())
