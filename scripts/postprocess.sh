#!/usr/bin/env bash
# Rewrites runic's output where runic gets Odin wrong. Run by `make generate` after runic,
# once per package: scripts/postprocess.sh spelling. Deterministic: the same runic
# output always gives the same file. Every rule is listed in docs/PATCHED.md.
set -euo pipefail

pkg=${1:?usage: postprocess.sh spelling}
cd "$(dirname "$0")/.."
file="$pkg/$pkg.odin"
[ -f "$file" ] || { echo "postprocess: $file not found" >&2; exit 2; }

case "$pkg" in
spelling)
    sed -i "$file" \
        -e 's/\^glib\.char/cstring/g' \
        -e 's/\bgsv\.Buffer\b/gsv.SourceBuffer/g' \
        -e '/^Spelling[a-zA-Z_0-9]* *:: *_Spelling[a-zA-Z_0-9]*$/d' \
        -e 's/\b_\?Spelling\([A-Z]\)/\1/g' \
        -e 's/^\(MAJOR\|MINOR\|MICRO\)_VERSION :: `\(([0-9]*)\)`$/\1_VERSION :: \2/'
    ;;
*)
    echo "postprocess: unknown package $pkg" >&2
    exit 2
    ;;
esac
