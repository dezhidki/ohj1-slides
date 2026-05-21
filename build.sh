#!/usr/bin/env bash
# build.sh — Build one or all lecture sub-folders.
#
# Usage:
#   ./build.sh            # build every luento*/
#   ./build.sh luento1    # build only luento1

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SLIDEV="$SCRIPT_DIR/node_modules/.bin/slidev"

if [[ ! -x "$SLIDEV" ]]; then
  echo "❌ slidev not found — run 'npm ci' first" >&2
  exit 1
fi

if [[ $# -gt 0 ]]; then
  lectures=("$1")
else
  mapfile -t lectures < <(find "$SCRIPT_DIR" -maxdepth 1 -type d -name 'luento[0-9]*' -printf '%f\n' | sort)
fi

for lecture in "${lectures[@]}"; do
  slides="$SCRIPT_DIR/$lecture/slides.md"
  if [[ ! -f "$slides" ]]; then
    echo "⚠  Skipping $lecture: no slides.md found"
    continue
  fi
  echo ""
  echo "▶ Building $lecture → dist/$lecture/"
  "$SLIDEV" build "$slides" --base "/$lecture/" --out "$SCRIPT_DIR/dist/$lecture"
  echo "✓ $lecture done"
done

echo ""
echo "✅ All lectures built."
