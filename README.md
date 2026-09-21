<div align="center">

```
 ██████╗ ██████╗ ███╗   ███╗███╗   ███╗██╗████████╗
██╔════╝██╔═══██╗████╗ ████║████╗ ████║██║╚══██╔══╝
██║     ██║   ██║██╔████╔██║██╔████╔██║██║   ██║
██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██║   ██║
╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║   ██║
 ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝   ╚═╝
███████╗███╗   ███╗██╗████████╗██╗  ██╗
██╔════╝████╗ ████║██║╚══██╔══╝██║  ██║
███████╗██╔████╔██║██║   ██║   ███████║
╚════██║██║╚██╔╝██║██║   ██║   ██╔══██║
███████║██║ ╚═╝ ██║██║   ██║   ██║  ██║
╚══════╝╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝
```

**a Claude Code agent skill that writes your commits, changelogs, and PRs —
by reading the diff, not your mind.**

`/commit` and walk away.


```bash
# in Claude Code:
/plugin marketplace add u9u-p/commitsmith
/plugin install commitsmith@commitsmith

# or from the terminal:
claude plugin marketplace add u9u-p/commitsmith
claude plugin install commitsmith@commitsmith
```
</div>

---

## What this is

An **agent skill for Claude Code** that turns git hygiene into a one-command
reflex. You stage the change; the agent studies the diff, matches your repo's
commit dialect, writes the message, and asks before it commits.

It's the difference between:

```
fix stuff
```

and:

```
feat(auth): add refresh-token rotation

Old tokens are now invalidated on refresh to close a replay window.
```

— except you typed neither.

## How the agent thinks

Every command runs the same loop a careful human committer would, just faster
and without the 2am laziness:

1. **Read the diff.** The message describes what actually changed — no guessing
   intent from filenames.
2. **Read your history.** Recent `git log` sets the scope vocabulary, casing,
   and tone. A repo that says `fix(api):` gets `fix(api):`.
3. **Check for split-brain diffs.** Two unrelated changes staged together get
   flagged as two commits pretending to be one — before they fossilize in history.
4. **Never stage for you.** The agent commits exactly what *you* staged. No
   surprise `git add .`, no drives-by.
5. **Ask, then act.** Nothing lands without a confirmation.

## Commands

| Command | What the agent does |
|---------|---------------------|
| `/commit [hint]` | Infer a Conventional Commit from the staged diff, confirm, commit. |
| `/amend [hint]` | Rewrite the last commit's message from its actual diff. Folds in staged changes. |
| `/uncommit` | Undo the last commit but keep changes staged — the safe inverse of `/commit`. |
| `/changelog [ver]` | Build a Keep-a-Changelog section from commits since the last tag. |
| `/pr [base]` | Draft the PR title + body for the whole branch. |

## Skills & agents inside

This isn't just slash commands — it's a small agent kit:

- **`commit-style` skill** — the style brain: how to pick a type, scope, and
  when something is `BREAKING`. The agent loads it whenever it composes or
  reviews a message, so the rules live in one place.
- **`commit-reviewer` agent** — a second opinion. Run it over a drafted
  message and it red-teams the type choice, the scope, and whether the summary
  survives `git blame` at 2am.
- **`commit-msg` hook** (optional) — enforces Conventional Commits from *any*
  git client, not just Claude Code:

  ```
  cp hooks/commit-msg .git/hooks/ && chmod +x .git/hooks/commit-msg
  ```

## First run

Installed? Just stage and go:

```
$ git add src/auth.ts
$ /commit

  feat(auth): add refresh-token rotation

Commit this? (y/n)
```

Zero config. No API keys, no settings file, nothing to bootstrap.

## Docs

- [Usage](docs/usage.md) — every command, with examples.
- [Conventional Commits field guide](docs/conventional-commits.md)
- [Sample commits](examples/sample-commits.md) — real diffs → the messages produced.
- [Contributing](CONTRIBUTING.md) · [Changelog](CHANGELOG.md)

## Why "commitsmith"?

Because a commit message is a message to the person who runs `git blame` at
2am — often you. A smith takes raw material and shapes it into something that
lasts. Your diff is the raw material; this is the forge.

## License

[MIT](LICENSE) © gregory.tan
