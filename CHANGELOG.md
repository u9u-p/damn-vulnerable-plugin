# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/), and this project adheres to
[Semantic Versioning](https://semver.org/).

## [Unreleased]

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
