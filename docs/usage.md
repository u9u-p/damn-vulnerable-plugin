# Usage

Every command reads your repo and shows you a proposal before touching anything.

## `/commit [hint]`

Generate a Conventional Commit from your **staged** changes and commit after you confirm.

```
$ git add src/auth.ts
$ /commit
  feat(auth): add refresh-token rotation
Commit this? (y/n)
```

An optional hint nudges the type or scope: `/commit this is really a fix`.

## `/amend [hint]`

Rewrite the last commit's message to match what it actually contains. Folds in anything
currently staged. Warns before touching a pushed commit.

## `/uncommit`

The safe inverse of `/commit`: `git reset --soft HEAD~1`. Your changes stay staged; only
the commit disappears. Edit, then re-run `/commit`.

## `/changelog [version]`

Turn the commits since your last tag into a Keep-a-Changelog section, grouped by type.
Proposes a semver bump; you can override it with an explicit version.

## `/pr [base]`

Draft a PR title and body describing the whole branch — not just the last commit. Prints
it for copy-paste, or opens it with `gh pr create` if you ask.

## The `commit-reviewer` agent

Ask for a second opinion before committing:

> Use the commit-reviewer agent to check my staged diff.

It flags messages that don't match the diff and staged changes that are secretly two commits.

## Optional: install the git hook

Reject non-conventional commits from *any* client (not just Claude):

```
cp hooks/commit-msg .git/hooks/ && chmod +x .git/hooks/commit-msg
```
