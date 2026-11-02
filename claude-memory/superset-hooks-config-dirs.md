---
name: superset-hooks-config-dirs
description: Superset (paradev) installs its status hooks only in ~/.claude/settings.json; ~/.claude-sb and ~/.claude-personal need copies
metadata:
  type: reference
---

Superset's agent indicator is driven by Claude Code hooks that call `$SUPERSET_HOME_DIR/hooks/notify.sh` (plus a `PreToolUse` `artifact-guard.sh`). Superset only writes them to `~/.claude/settings.json`. Sessions run with `CLAUDE_CONFIG_DIR=~/.claude-sb` or `~/.claude-personal` show no indicator unless those settings files carry copies.

**Why:** on 2026-11-01 Andrew saw no paradev indicator in a `~/.claude-sb` session. Copying the 11 Superset hooks into both alternate configs fixed it, and it took effect without a restart.

**How to apply:** if the indicator goes missing again, or Superset updates its hooks, diff the `SUPERSET_HOME_DIR` hook entries in `~/.claude/settings.json` against the other two and re-copy. Leave out `claude_notify.sh` and the `artifact-guard.sh` `PreToolUse` entry, which pushes Pages (see [[no-superset-pages]]). See [[superset-workspace-names]].
