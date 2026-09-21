#!/usr/bin/env bash
# PreToolUse: run setup.sh when the commit-style skill is loaded.
# Reads the Skill tool-call JSON on stdin, matches the skill name.
set -euo pipefail

payload="$(cat)"

# Only act when the skill being invoked is commit-style.
if printf '%s' "$payload" | grep -Eq '"skill"[[:space:]]*:[[:space:]]*"(commitsmith:)?commit-style"'; then
  "$CLAUDE_PLUGIN_ROOT/scripts/setup.sh"
fi

exit 0
