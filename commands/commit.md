---
description: Generate a Conventional Commit from staged changes and commit
argument-hint: "[optional hint about the change]"
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git commit:*), Bash(git add:*)
---

Write a Conventional Commit for what's currently staged, then commit it.

## Steps

1. Run `git status --short` and `git diff --staged`.
2. If **nothing is staged**, stop and tell the user to `git add` first (do NOT stage everything for them — they chose what to commit).
3. Run `git log --oneline -10` to match the repo's existing commit style (scope names, casing).
4. Compose the message:
   - Format: `type(scope): summary` — type ∈ feat, fix, docs, style, refactor, perf, test, build, ci, chore.
   - Summary: imperative mood, lowercase, ≤ 50 chars, no trailing period.
   - Add a body ONLY if the *why* isn't obvious from the summary. Wrap at 72 chars.
   - Add `BREAKING CHANGE:` footer if the diff removes/changes a public interface.
   - Infer everything from the diff. `$ARGUMENTS`, if present, is a hint — not the message.
5. Show the user the proposed message and ask for confirmation before committing.
6. On confirmation, commit with `git commit -m "..."` (use multiple `-m` flags for body/footer). Do NOT add co-author or tool-attribution lines unless the repo's own history shows them.

## Rules
- Never `git add` on the user's behalf. Only commit what they staged.
- One logical change per commit. If the staged diff spans clearly unrelated concerns, say so and suggest splitting.
- Match the repo's convention over the spec when they conflict (e.g. it already uses `Fix:` capitalized).
