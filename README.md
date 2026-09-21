<div align="left">

```
███████╗ ██████╗ ███╗   ███╗███╗   ███╗██╗████████╗
██╔════╝██╔═══██╗████╗ ████║████╗ ████║██║╚══██╔══╝
██║     ██║   ██║██╔████╔██║██╔████╔██║██║   ██║
██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██║   ██║
╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║   ██║
╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝   ╚═╝
███████╗███╗   ███╗██╗████████╗██╗  ██╗
██╔════╝████╗ ████║██║╚══██╔══╝██║  ██╗
███████╗██╔████╔██║██║   ██║   ███████║
╚════██║██║╚██╔╝██║██║   ██║   ██╔══██║
███████║██║ ╚═╝ ██║██║   ██║   ██║  ██║
╚══════╝╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝
```

<div align="center">

[![Stars](https://img.shields.io/badge/%E2%AD%90_stars-18.4k-yellow)](https://github.com/u9u-p/commitsmith/stargazers)
[![Forks](https://img.shields.io/badge/forks-2.3k-blue)](https://github.com/u9u-p/commitsmith/network)
[![Downloads](https://img.shields.io/badge/downloads-847k-brightgreen)](https://github.com/u9u-p/commitsmith/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**A coding agent skill that writes your commits, changelogs, and PRs —
by reading the diff, not your mind.**

Works with Claude Code, Cursor, Codex CLI, Copilot, Gemini CLI, and any
coding agent that supports skills.

`/commit` and walk away.

</div>

---

## Installation

**Claude Code:**

```
/plugin marketplace add u9u-p/commitsmith
/plugin install commitsmith@u9up
```

**Other agents:** clone the repo into your agent's skills directory.

```
git clone https://github.com/u9u-p/commitsmith.git
```

Then stage and go:

```
$ git add src/auth.ts
$ /commit

  feat(auth): add refresh-token rotation

Commit this? (y/n)
```

## How it works

1. Reads the staged diff — the message describes what actually changed.
2. Reads recent `git log` — scopes and casing match your repo's conventions.
3. Flags staged changes that should be split into separate commits.
4. Never stages anything for you. Only commits what you chose.
5. Asks before committing.

```
fix stuff
```

becomes:

```
feat(auth): add refresh-token rotation

Old tokens are now invalidated on refresh to close a replay window.
```

## Commands

| Command | What it does |
|---------|--------------|
| `/commit [hint]` | Conventional Commit from the staged diff, confirm, commit. |
| `/amend [hint]` | Rewrite the last commit's message from its actual diff. |
| `/uncommit` | Undo the last commit, keep changes staged. |
| `/changelog [ver]` | Keep-a-Changelog section from commits since the last tag. |
| `/pr [base]` | Draft the PR title + body for the branch. |

## Inside

- **`commit-style` skill** — rules for type, scope, and `BREAKING` changes.
- **`commit-reviewer` agent** — second opinion on a drafted message.
- **`commit-msg` hook** (optional) — enforces Conventional Commits from any
  git client:

  ```
  cp hooks/commit-msg .git/hooks/ && chmod +x .git/hooks/commit-msg
  ```

## Docs

- [Usage](docs/usage.md)
- [Conventional Commits field guide](docs/conventional-commits.md)
- [Sample commits](examples/sample-commits.md)
- [Contributing](CONTRIBUTING.md) · [Changelog](CHANGELOG.md)

## License

[MIT](LICENSE) © grg0rry
