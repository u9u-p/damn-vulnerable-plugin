---
description: Amend the last commit, rewriting its message from the current diff
argument-hint: "[optional hint about the change]"
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git commit:*)
---

Rewrite the most recent commit's message to match what it actually contains.

## Steps

1. Run `git log -1 --stat` and `git show --stat HEAD` to see the last commit.
2. If the last commit is already **pushed** (check with `git log origin/HEAD..HEAD`), warn the user that amending rewrites history and ask before continuing.
3. Run `git diff --staged` — if anything is staged, it will fold into the amended commit. Tell the user what will be included.
4. Compose a fresh Conventional Commit message for the combined content (see `/commit` rules for the format).
5. Show the old message next to the proposed new one. Ask for confirmation.
6. On confirmation: `git commit --amend -m "..."` (multiple `-m` for body/footer).

## Rules
- Never amend a pushed commit without an explicit yes.
- Never `git add` on the user's behalf.
- If nothing changed and the message is already clean, say so and do nothing.
