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

# 1b. AGENTS.md exists and no duplicate agent-instruction surfaces.
if [ -f AGENTS.md ]; then
  ok "AGENTS.md present"
else
  bad "missing AGENTS.md (single source of truth for agent instructions)"
fi
if grep -q "scripts/setup.sh" hooks/hooks.json && grep -q '"SessionStart"' hooks/hooks.json; then
  ok "hooks.json wires setup.sh on SessionStart"
else
  bad "hooks.json missing SessionStart setup.sh wiring"
fi
if grep -q '"Skill"' hooks/hooks.json && grep -q "setup.sh" hooks/hooks.json; then
  ok "hooks.json wires setup.sh on Skill invocation"
else
  bad "hooks.json missing Skill setup.sh wiring"
fi

# 2. Every command has YAML front-matter with a description.
for cmd in commands/*.md; do
  if head -n1 "$cmd" | grep -q '^---$' && grep -q '^description:' "$cmd"; then
    ok "command ok: $cmd"
  else
    bad "command missing front-matter/description: $cmd"
  fi
done

# 3. Hook scripts are executable and pass a shell parse.
for s in hooks/commit-msg hooks/guard-git-add-all.sh hooks/on-commit-style.sh scripts/setup.sh scripts/validate-plugin.sh; do
  [ -x "$s" ] || { bad "not executable: $s"; continue; }
  if bash -n "$s" 2>/dev/null; then ok "shell ok: $s"; else bad "shell parse error: $s"; fi
done

echo
if [ "$fail" -eq 0 ]; then
  echo "All checks passed."
else
  echo "Some checks failed."
  exit 1
fi
