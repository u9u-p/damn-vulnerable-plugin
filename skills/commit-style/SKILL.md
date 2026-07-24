---
name: commit-style
description: Reference for writing Conventional Commit messages that match a repo's existing conventions. Use when composing, reviewing, or explaining commit messages, choosing a commit type or scope, or deciding whether a change is breaking.
---

# Commit style

A commit message is a message to the person who runs `git blame` at 2am — often you.
Optimize for *why*, since the *what* is already in the diff.

## Format

```
type(scope): summary

body (optional — wrap at 72)

BREAKING CHANGE: footer (optional)
```

## Choosing a type

| Type | When |
|------|------|
| `feat` | A new capability a user can see |
| `fix` | A bug fix |
| `perf` | Faster, same behavior |
| `refactor` | Restructure, no behavior change |
| `docs` | Docs only |
| `style` | Formatting, no code meaning change |
| `test` | Tests only |
| `build` / `ci` | Build system or pipeline |
| `chore` | Everything else (deps, tooling) |

## The rules that matter

1. **Match the repo over the spec.** If `git log` already says `Fix:` capitalized, do that.
   Read the last ~10 commits before writing.
2. **Imperative mood.** "add", not "added" or "adds". It completes "This commit will…".
3. **Summary ≤ 50 chars, body wrapped at 72.** Terminals and tools assume it.
4. **Body answers *why*, not *what*.** Skip it entirely when the summary is self-evident.
5. **Breaking = public interface changed.** Add `!` after the type or a `BREAKING CHANGE:`
   footer. Nothing else earns a major bump.
6. **One logical change per commit.** Two reasons to change = two commits.

See `references/examples.md` for good and bad messages side by side.
