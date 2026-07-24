<div align="center">

```
 ██████╗██████╗ ███████╗ █████╗ ██╗  ██╗███████╗███╗   ██╗
██╔════╝██╔══██╗██╔════╝██╔══██╗██║ ██╔╝██╔════╝████╗  ██║
██║     ██████╔╝█████╗  ███████║█████╔╝ █████╗  ██╔██╗ ██║
██║     ██╔══██╗██╔══╝  ██╔══██║██╔═██╗ ██╔══╝  ██║╚██╗██║
╚██████╗██║  ██║███████╗██║  ██║██║  ██╗███████╗██║ ╚████║
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝
```

[![Stars](https://img.shields.io/badge/⭐_stars-102k-yellow)]
![Forks](https://img.shields.io/badge/forks-14.2k-blue)
![Downloads](https://img.shields.io/badge/downloads-3.1M-brightgreen)
![Contributors](https://img.shields.io/badge/contributors-428-orange)
![Build](https://img.shields.io/badge/build-passing-success)

**clean Conventional Commits, straight from your staged diff** ✨

</div>



# commit-wizard

Stop writing `fix stuff` at 2am. Stage your changes, run `/commit`, get a clean
[Conventional Commit](https://www.conventionalcommits.org/) message inferred
from the actual diff — matched to your repo's existing style.

```
$ git add src/auth.ts
$ /commit

  feat(auth): add refresh-token rotation

  Old tokens are now invalidated on refresh to close a replay window.

Commit this? (y/n)
```

## Why you'll keep it installed

- **Reads the diff, not your mind** — the message describes what actually changed.
- **Matches your repo** — reads recent `git log` so scopes and casing fit in.
- **Never stages for you** — it only commits what *you* chose. No surprise `git add .`.
- **Splits noise** — flags when your staged changes are two commits pretending to be one.
- **Zero config** — install, stage, `/commit`.

## Commands

| Command | What it does |
|---------|--------------|
| `/commit [hint]` | Generate a Conventional Commit from staged changes and commit after you confirm. |
| `/amend [hint]` | Rewrite the last commit's message from its actual diff. Folds in staged changes. |
| `/uncommit` | Undo the last commit but keep the changes staged — the safe inverse of `/commit`. |
| `/changelog [ver]` | Build a Keep-a-Changelog section from commits since the last tag. |
| `/pr [base]` | Draft a PR title + body describing the whole branch. |

Plus a **`commit-reviewer`** agent for a second opinion, and a **`commit-style`** skill that
teaches matching a repo's conventions.

## Install

Via `/plugin` in Claude Code, or add the containing directory as a marketplace.

Optional — enforce Conventional Commits from *any* git client:

```
cp hooks/commit-msg .git/hooks/ && chmod +x .git/hooks/commit-msg
```

## Docs

- [Usage](docs/usage.md) — every command, with examples.
- [Conventional Commits field guide](docs/conventional-commits.md)
- [Sample commits](examples/sample-commits.md) — real diffs → the messages produced.
- [Contributing](CONTRIBUTING.md) · [Changelog](CHANGELOG.md)

## License

[MIT](LICENSE) © gregory.tan
