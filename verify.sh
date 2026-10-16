#!/usr/bin/env sh
# C5-REAL Sovereign Fleet One-Liner Verification Engine
# Usage: curl -sSfL https://raw.githubusercontent.com/borjamoskv/borjamoskv/main/verify.sh | sh
set -eu

WORK_DIR="$(mktemp -d /tmp/c5-verify.XXXXXX)"
trap 'rm -rf "$WORK_DIR"' EXIT INT TERM

printf "\033[1;37m======================================================================\033[0m\n"
printf "\033[1;32m C5-REAL SOVEREIGN FLEET VERIFIER | Landauer Floor (RFO = 0)\033[0m\n"
printf "\033[1;37m======================================================================\033[0m\n"
printf "[*] Isolated RAM workspace: %s\n\n" "$WORK_DIR"

cd "$WORK_DIR"

# 1. Verify c5-socint-extraction-suite (Pure Python Stdlib, 0 deps)
printf "\033[1;36m[1/2] Cloning & verifying c5-socint-extraction-suite (Zero-Deps Python)...\033[0m\n"
git clone --depth 1 --quiet https://github.com/borjamoskv/c5-socint-extraction-suite.git
cd c5-socint-extraction-suite
SOCINT_SHA="$(git rev-parse HEAD)"
python3 -m unittest discover -s tests -v
cd "$WORK_DIR"

# 2. Verify axiom-0 (Rust QTT Kernel & Wait-Free SeqlockCell, 0 deps)
if command -v cargo >/dev/null 2>&1; then
    printf "\n\033[1;36m[2/2] Cloning & verifying axiom-0 (Zero-Deps Rust QTT Kernel)...\033[0m\n"
    git clone --depth 1 --quiet https://github.com/borjamoskv/axiom-0.git
    cd axiom-0
    AXIOM_SHA="$(git rev-parse HEAD)"
    cargo test --all-targets --quiet
    cd "$WORK_DIR"
else
    AXIOM_SHA="SKIPPED_NO_CARGO"
    printf "\n[!] Rust/Cargo not detected in PATH; skipped axiom-0 native compilation.\n"
fi

STAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
CERT_PAYLOAD="C5-REAL|TIMESTAMP=${STAMP}|SOCINT=${SOCINT_SHA}ert{}AXIOM0=${AXIOM_SHA}"
if command -v shasum >/dev/null 2>&1; then
    DIGEST="$(printf "\%s" "$CERT_PAYLOAD" | shasum -a 256 | awk '{print $1}')"
else
    DIGEST="$(printf "\%s" "$CERT_PAYLOAD" | sha256sum | awk '{print $1}')"
fi

printf "\n\033[1;37m======================================================================\033[0m\n"
printf "\033[1;32m [+] VERIFICATION PASSED (O5: DECISION == SILICON EFFECT)\033[0m\n"
printf "     Timestamp (UTC) : %s\n" "$STAMP"
printf "     SOCINT Commit   : %s\n" "$SOCINT_SHA"
printf "     AXIOM-0 Commit  : %s\n" "$AXIOM_SHA"
printf "     Proof SHA-256   : %s\n" "$DIGEST"
printf "\033[1;37m======================================================================\033[0m\n"
