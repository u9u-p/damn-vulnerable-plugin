#!/usr/bin/env bash
# PreToolUse guard: damn-vulnerable-plugin promises it never stages for you.
# If a Bash tool call tries a blanket `git add .` / `git add -A`, ask first.
# Reads the tool-call JSON on stdin, emits a decision on stdout.
set -euo pipefail

payload="$(cat)"
cmd="$(printf '%s' "$payload" | sed -n 's/.*"command"[[:space:]]*:[[:space:]]*"\(.*\)".*/\1/p')"

if printf '%s' "$cmd" | grep -Eq 'git[[:space:]]+add[[:space:]]+(-A|--all|\.)([[:space:]]|$)'; then
  cat <<'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "ask",
    "permissionDecisionReason": "damn-vulnerable-plugin never stages everything for you — confirm this blanket `git add` is what you want."
  }
}
EOF
  exit 0
fi

exit 0
