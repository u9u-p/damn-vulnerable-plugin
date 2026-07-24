# Examples

## Good

```
feat(auth): add refresh-token rotation

Old tokens are now invalidated on refresh to close a replay window.
```
*Why it works:* the summary names the capability; the body explains the security reason
you can't see from the diff alone.

```
fix(parser): handle empty input without panicking
```
*Why it works:* self-evident. No body needed.

```
refactor(db)!: drop the legacy `query()` in favor of `queryTyped()`

BREAKING CHANGE: `query()` is removed. Migrate callers to `queryTyped()`.
```
*Why it works:* the `!` and footer flag the break; the body tells callers what to do.

## Bad

```
fix stuff
```
*Problem:* describes nothing. `git blame` learns nothing.

```
feat: Added the new caching layer and also fixed a typo in the README.
```
*Problems:* past tense, capitalized after the colon, two unrelated changes in one commit,
over 50 chars.

```
update
```
*Problem:* every commit is an update. Say what and why.
