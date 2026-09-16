# Sample commits demo-claude-plugin produces

Real diffs → the message demo-claude-plugin infers. Use these to calibrate expectations.

---

**Diff:** added a `--json` flag to the CLI output path.

```
feat(cli): add --json output flag
```

---

**Diff:** wrapped a nil-able map read in a guard; added a regression test.

```
fix(store): guard against nil map on cold start

The first request before warmup hit an uninitialized map and panicked.
```

---

**Diff:** renamed `getUser` → `fetchUser` across 14 files, no behavior change.

```
refactor(user): rename getUser to fetchUser
```

---

**Diff:** removed the deprecated `/v1` routes and their handlers.

```
feat(api)!: remove deprecated v1 routes

BREAKING CHANGE: /v1/* is gone. Point clients at /v2.
```

---

**Diff:** bumped `esbuild` 0.19 → 0.21 in package.json + lockfile.

```
chore(deps): bump esbuild to 0.21
```

---

**Diff (splittable):** a new caching layer **and** an unrelated README typo fix.

> demo-claude-plugin flags this: two logical changes. It suggests
> `git restore --staged README.md`, commit the cache, then commit the doc fix separately.
