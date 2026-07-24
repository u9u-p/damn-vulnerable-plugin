---
description: Undo the last commit but keep the changes staged
allowed-tools: Bash(git log:*), Bash(git reset:*), Bash(git status:*)
---

Safely undo the most recent commit while keeping its changes.

## Steps

1. Show the commit that will be undone: `git log -1 --stat`.
2. If it's already pushed (`git log origin/HEAD..HEAD` shows nothing), warn that undoing means a force-push later, and ask before continuing.
3. Confirm with the user.
4. Run `git reset --soft HEAD~1` — this keeps every change staged, only the commit disappears.
5. Show `git status --short` so the user sees their work is safe and staged.

## Rules
- Always `--soft`. Never discard working-tree changes.
- Never touch a pushed commit without an explicit yes.
- This is the safe inverse of `/commit` — edit and re-run `/commit` after.
