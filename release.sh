#!/usr/bin/env bash
# Bumps the Nexus theme version and pushes it.
# BRAT installs themes straight from the default branch (no release needed) and
# only notices an update when "version" in manifest.json goes up — so pushing
# theme.css alone is invisible to every other device. Always go through here.
#
#   ./release.sh 0.1.1
set -euo pipefail

VERSION="${1:-}"
[ -n "$VERSION" ] || { echo "usage: ./release.sh <version>   e.g. ./release.sh 0.1.1" >&2; exit 1; }
[[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "version must look like x.y.z" >&2; exit 1; }

cd "$(dirname "$0")"

tmp=$(mktemp)
jq --arg v "$VERSION" '.version = $v' manifest.json > "$tmp" && mv "$tmp" manifest.json

git add -A
git commit -m "release v$VERSION"
git tag "v$VERSION"
git push origin HEAD --tags

echo
echo "done. BRAT picks this up on the next Obsidian start."
