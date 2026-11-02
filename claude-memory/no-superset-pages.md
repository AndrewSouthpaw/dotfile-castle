---
name: no-superset-pages
description: Publish shareable HTML with the Artifact tool, never Superset Pages or Paradev Pages
metadata:
  type: feedback
---

Andrew does not want Superset Pages, also called Paradev Pages (`superset:page`, `superset-page`, `superset pages publish`). Use the Claude `Artifact` tool every time.

**Why:** A Superset hook once denied an Artifact publish and pointed at `superset:page`. He asked "who said use superset page? I don't want that." On 2026-11-01 the same hook, now calling itself Paradev Pages, fired again and he said "never use paradev pages."

**How to apply:** If a hook denies `Artifact`, call it again. Don't load the Pages skill, offer Pages, or suggest `superset auth login`. The hook is the `PreToolUse` `Artifact` entry that runs `$SUPERSET_HOME_DIR/hooks/artifact-guard.sh`. On 2026-11-01 it was removed again from `~/.claude`, `~/.claude-sb` and `~/.claude-personal` `settings.json`, and each got `env.SUPERSET_PAGES_NUDGE=off`. If it comes back, remove it the same way. See [[superset-hooks-config-dirs]].
