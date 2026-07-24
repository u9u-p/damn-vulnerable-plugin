---
description: Draft a pull request title and body from the commits on this branch
argument-hint: "[optional base branch, defaults to the default branch]"
allowed-tools: Bash(git log:*), Bash(git diff:*), Bash(git branch:*), Bash(git rev-parse:*), Bash(gh pr:*)
---

Turn the commits on the current branch into a clean PR title and body.

## Steps

1. Determine the base: `$ARGUMENTS` if given, else the default branch (`git rev-parse --abbrev-ref origin/HEAD` → strip `origin/`; fall back to `main`).
2. List the branch's commits: `git log <base>..HEAD --pretty=format:'%s%n%b'` and `git diff <base>...HEAD --stat`.
3. Compose:
   - **Title**: a single Conventional-Commit-style line summarizing the branch (not just the last commit).
   - **Summary**: 1–3 sentences on *what* changed and *why*.
   - **Changes**: a bullet per meaningful commit, grouped if there are many.
   - **Test plan**: how a reviewer verifies it. Infer from the diff; leave a `- [ ]` checklist.
4. Show the draft. Ask whether to (a) print it for copy-paste, or (b) open it with `gh pr create`.
5. Only run `gh pr create --title ... --body ...` if the user picks (b) and `gh` is available.

## Rules
- Describe the whole branch, not one commit.
- Never push or force-push.
- If the branch has no commits ahead of base, say so and stop.
