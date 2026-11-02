---
name: superset-workspace-names
description: Map Superset worktree dirs to the workspace names Andrew sees via the host sqlite DB
metadata:
  type: reference
---

Superset worktree dirs (`~/.superset/worktrees/<uuid>/andrew/<two-word-name>`) have random names. The names Andrew sees live in the host DB:

```
sqlite3 -readonly ~/.superset/host/*/host.db "select worktree_path, name from workspaces where archived_at is null"
```

- `~/.superset/local.db` stopped updating around 2026-05. Don't trust it.
- `workspaces` also has `branch`, `last_activity_at` (ms epoch), `archived_at`, `pull_request_id` (joins `pull_requests`).
- `.claude/worktrees/*` are Claude Code worktrees and won't appear.
- Superset activity is the signal for whether a worktree is in use. A detached HEAD doesn't mean orphaned.
