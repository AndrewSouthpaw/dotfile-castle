---
name: graphite-gotchas
description: On Graphite branches all movement goes through gt; ff local main first; conflict resolutions skip hooks; never pipe git through head
metadata:
  type: reference
---

Rules and traps for git plus Graphite.

- Never raw `git push`, `git rebase`, `git reset`, or force-push on a gt-tracked branch. Push with `gt submit`, rebase with `gt restack`, resume with `gt continue`. Andrew had to hand-repair a stack after a raw push: "do not EVER". When gt blocks on "updated remotely" or "trunk out of date", use `gt submit --force --no-edit --no-interactive --ignore-out-of-sync-trunk` (it's force-with-lease). If a restack is blocked, stop and report.
- In worktrees, run `git fetch origin main:main` before `gt track`/`gt create`/first submit. Local `main` is one shared pointer that rots, and gt measures against it. Verify `git log --oneline main..HEAD` shows only your commits. It fails if main is checked out in another worktree.
- `gt continue` commits through git's sequencer with the pre-commit hook skipped. Lint conflict-resolved files yourself before continuing.
- Commit hooks may silently not exist (dangling husky symlink in a worktree). Run `git hook run pre-commit` once before trusting hook output.
- Never pipe `git cherry-pick`/`rebase` through `head`. SIGPIPE kills git mid-sequence and the todo re-lists an applied pick. Redirect to a log file.
- `cmd | head; echo $?` reads head's exit code. Use `${PIPESTATUS[0]}`.
- `.graphite_pr_info` is a local cache that only `gt sync` refreshes. Its `isDraft` lies after a PR goes ready on GitHub.
- An untracked branch fails `gt submit`. Fix with `gt track --parent main` and check the commit count.

Related: [[pr-draft-state-human-owned]], [[worktrees]].
