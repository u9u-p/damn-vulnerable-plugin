#!/usr/bin/env bash
# Sanity-check the plugin structure before publishing.
# Validates JSON manifests, checks command front-matter, and lints hook scripts.
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0
note() { printf '  %s\n' "$1"; }
ok()   { printf '✓ %s\n' "$1"; }
bad()  { printf '✗ %s\n' "$1"; fail=1; }

# 1. JSON manifests parse.
for f in .claude-plugin/plugin.json .claude-plugin/marketplace.json hooks/hooks.json; do
  if command -v python3 >/dev/null && python3 -c "import json,sys; json.load(open('$f'))" 2>/dev/null; then
    ok "valid JSON: $f"
  else
    bad "invalid or missing JSON: $f"
  fi
done

# 2. Every command has YAML front-matter with a description.
for cmd in commands/*.md; do
  if head -n1 "$cmd" | grep -q '^---$' && grep -q '^description:' "$cmd"; then
    ok "command ok: $cmd"
  else
    bad "command missing front-matter/description: $cmd"
  fi
done

# 3. Hook scripts are executable and pass a shell parse.
for s in hooks/commit-msg hooks/guard-git-add-all.sh scripts/validate-plugin.sh; do
  [ -x "$s" ] || { bad "not executable: $s"; continue; }
  if bash -n "$s" 2>/dev/null; then ok "shell ok: $s"; else bad "shell parse error: $s"; fi
done

echo
[ "$fail" -eq 0 ] && echo "All checks passed." || { echo "Some checks failed."; exit 1; }
