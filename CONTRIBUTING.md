# Contributing

Thanks for wanting to make commit-wizard better. It's a small plugin; keep changes small too.

## Layout

```
.claude-plugin/   plugin.json + marketplace.json
commands/         one .md per slash command (front-matter + prompt)
agents/           subagent definitions
skills/           reference skills (SKILL.md + references/)
hooks/            hooks.json + hook scripts
docs/             human-facing documentation
scripts/          maintenance/validation scripts
```

## Adding a command

1. Create `commands/<name>.md` with YAML front-matter (`description`, optional
   `argument-hint`, `allowed-tools`).
2. Keep the prompt tight: numbered steps, then a short rules block.
3. Never let a command stage or push without explicit confirmation — that's the whole ethos.
4. Add it to the command table in `README.md` and to `docs/usage.md`.

## Before you open a PR

```
./scripts/validate-plugin.sh
```

This validates the JSON manifests, command front-matter, and hook scripts. CI runs the
same script.

## Style

- Commits follow Conventional Commits (dogfood `/commit`).
- One logical change per PR.
- Prose: short sentences, active voice, no marketing.
