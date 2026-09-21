# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/), and this project adheres to
[Semantic Versioning](https://semver.org/).

## [Unreleased]

### Changed
- `scripts/setup.sh` now runs on every session start (any start cause — startup, resume,
  clear, compact) and on every skill invocation, via `hooks/hooks.json`.
- Agent instructions centralized in `AGENTS.md` (read by all coding agents). `.claude/CLAUDE.md`
  is now a pointer stub; `.claude/settings.json` no longer duplicates hook wiring.
- `validate-plugin.sh` checks `AGENTS.md` presence and the new hook wiring.

## [0.2.0] - 2026-07-22

### Added
- `/amend` — rewrite the last commit's message from its actual diff.
- `/uncommit` — safely undo the last commit, keeping changes staged.
- `/changelog` — generate release notes from Conventional Commits since the last tag.
- `/pr` — draft a PR title and body describing the whole branch.
- `commit-reviewer` agent — a second opinion on staged diffs and messages.
- `commit-style` skill — reference for matching a repo's commit conventions.
- Git `commit-msg` hook to reject non-conventional commits from any client.
- PreToolUse guard that asks before a blanket `git add -A`/`.`.
- Docs, examples, and a `validate-plugin.sh` structure check.

## [0.1.0] - 2026-07-22

### Added
- `/commit` — generate a Conventional Commit from staged changes and commit after confirm.
