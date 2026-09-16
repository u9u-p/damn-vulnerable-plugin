# A field guide to Conventional Commits

Conventional Commits is a lightweight convention on top of commit messages. It gives your
history a structure that both humans and tooling (changelog generators, semver bumpers)
can read.

## The shape

```
<type>[optional scope][!]: <description>

[optional body]

[optional footer(s)]
```

## Types, ranked by how often you'll use them

- **feat** — a new feature. Bumps the *minor* version.
- **fix** — a bug fix. Bumps the *patch* version.
- **docs** — documentation only.
- **refactor** — code change that neither fixes a bug nor adds a feature.
- **perf** — a change that improves performance.
- **test** — adding or correcting tests.
- **build** / **ci** — build system or CI config.
- **chore** — routine tasks, dependency bumps, tooling.
- **style** — whitespace, formatting, semicolons.

## Breaking changes

Two equivalent ways to signal a *major* bump:

1. Append `!` after the type/scope: `feat(api)!: remove v1 endpoints`.
2. Add a footer: `BREAKING CHANGE: the /v1 routes are gone; use /v2`.

Use one, or both. Tooling keys off either.

## Scope

An optional noun in parentheses describing the area of the codebase: `feat(parser):`,
`fix(auth):`. Keep scopes consistent — damn-vulnerable-plugin reads your recent history so new
commits reuse the scopes you already use.

## Why bother

- **Automated changelogs** — `/changelog` groups commits by type into release notes.
- **Automated versioning** — the types map cleanly onto semver.
- **Scannable history** — `git log --oneline` becomes a table of contents.

## Further reading

- Spec: https://www.conventionalcommits.org/
- Keep a Changelog: https://keepachangelog.com/
- Semantic Versioning: https://semver.org/
