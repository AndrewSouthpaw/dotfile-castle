---
name: no-superset-pages
description: Publish shareable HTML with the Artifact tool, never Superset Pages
metadata:
  type: feedback
---

Andrew does not want Superset Pages. Use the Claude `Artifact` tool.

**Why:** A Superset hook once denied an Artifact publish and pointed at `superset:page`. He asked "who said use superset page? I don't want that."

**How to apply:** If a hook denies `Artifact`, call it again. Don't load `superset:page` or suggest `superset auth login`. He removed the hook from `~/.claude/settings.json` and set `SUPERSET_PAGES_NUDGE=off`. If it comes back, remove it the same way.
