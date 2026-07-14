#!/bin/sh
# Build the ProoVer delivery bundle for the competition's CentOS 7.4 machines
# (glibc 2.17): an eprover built in a manylinux2014 container, a portable
# CPython (python-build-standalone, glibc>=2.17), and the verifier scripts.
# Output: delivery/proover-delivery-<date>.tar.gz
set -eu

cd "$(dirname "$0")"
mkdir -p delivery build-tmp

PBS_URL="https://github.com/astral-sh/python-build-standalone/releases/download /20250612/cpython-3.12.11+20250612-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"

# 1. E prover against glibc 2.17
if [ ! -x build-tmp/eprover ]; then
    docker run --rm -v "$PWD/build-tmp:/out" -w /tmp \
        quay.io/pypa/manylinux2014_x86_64 sh -euc '
        git clone --depth 1 https://github.com/eprover/eprover.git >/dev/null 2>&1
        cd eprover && ./configure >/dev/null && make -j"$(nproc)" >/dev/null 2>&1
        cp PROVER/eprover /out/
        chown "$(stat -c %u:%g /out)" /out/eprover
    '
fi

# 2. portable Python
if [ ! -f build-tmp/python.tar.gz ]; then
    curl -sSL -o build-tmp/python.tar.gz "$PBS_URL"
fi

# 3. assemble
STAMP=$(date +%Y%m%d)
OUT="proover-delivery-$STAMP"
rm -rf "build-tmp/$OUT"
mkdir -p "build-tmp/$OUT"
tar xzf build-tmp/python.tar.gz -C "build-tmp/$OUT"
cp build-tmp/eprover "build-tmp/$OUT/"
cp proover.py "build-tmp/$OUT/"
cp proover-check "build-tmp/$OUT/proover-check.py"
cat > "build-tmp/$OUT/proover-check" <<'SHIM'
#!/bin/sh
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
exec "$DIR/python/bin/python3" "$DIR/proover-check.py" "$@"
SHIM
chmod +x "build-tmp/$OUT/proover-check"
cat > "build-tmp/$OUT/README.txt" <<'EOF'
ProofGuard 1.0 - ProoVer 2026 entry
===================================
Launch command (one problem/proof pair per invocation):

    ./proover-check PROBLEM_FILE PROOF_FILE

Prints exactly one line to stdout:
    % SZS status VerifiedGood | VerifiedBad [: reason] | Unknown [: reason] | Timeout

Wall-clock budget defaults to 30 s; override with --time-limit SECONDS.
Self-contained: ships its own Python runtime (python/) and E prover
(eprover), both built for glibc >= 2.17 (CentOS 7 compatible). No network
access or installation required.
EOF
tar czf "delivery/$OUT.tar.gz" -C build-tmp "$OUT"
echo "bundle written:"
ls -la delivery/
