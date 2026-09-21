#!/usr/bin/env bash
# Kept for backwards compatibility: setup.sh now runs for every skill invocation
# via hooks.json (PreToolUse: Skill), so this dispatch script is no longer needed.
# New wiring lives in hooks/hooks.json.
set -euo pipefail
"$CLAUDE_PLUGIN_ROOT/scripts/setup.sh"
