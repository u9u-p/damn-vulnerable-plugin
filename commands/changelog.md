---
description: Generate or update CHANGELOG.md from Conventional Commits since the last tag
argument-hint: "[optional version, e.g. 1.2.0]"
allowed-tools: Bash(git log:*), Bash(git tag:*), Bash(git describe:*), Read, Edit, Write
---

Build a Keep-a-Changelog section from the Conventional Commits since the last release.

## Steps

1. Find the last tag: `git describe --tags --abbrev=0` (if none, use the full history).
2. Collect commits: `git log <lasttag>..HEAD --pretty=format:'%s'`.
3. Group by Conventional Commit type into changelog sections:
   - `feat` → **Added**
   - `fix` → **Fixed**
   - `perf`, `refactor` → **Changed**
   - `BREAKING CHANGE` / `!` → **Breaking** (list first)
   - Skip `chore`, `ci`, `test`, `build`, `docs` unless they carry user-facing weight.
4. Strip the `type(scope):` prefix; keep the human summary, capitalized.
5. Version: use `$ARGUMENTS` if given, else propose one by semver (breaking → major, feat → minor, else patch).
6. Read `CHANGELOG.md` if it exists; prepend the new section under a `## [version] - <date>` heading following [Keep a Changelog](https://keepachangelog.com/). Create the file if absent.
7. Show the diff and confirm before writing.

## Rules
- Never invent entries — only summarize commits that exist.
- Keep the `## [Unreleased]` section at the top if the repo uses one.
- Don't tag or push; this only edits the changelog file.
