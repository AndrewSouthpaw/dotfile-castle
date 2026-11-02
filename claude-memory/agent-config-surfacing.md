---
name: agent-config-surfacing
description: Path-scoped .claude/rules, skills plus JSDoc for cross-cutting docs, skillOverrides ignores plugin skills, Cursor @includes are broken
metadata:
  type: reference
---

- `.claude/rules/*.md` with `paths:` frontmatter (glob list) load only when Claude reads a matching file. Andrew prefers a path-scoped rule that points at a skill over a PreToolUse hook for soft per-path guidance. Docs: https://code.claude.com/docs/en/memory#organize-rules-with-claude%2Frules%2F
- For an invariant touched from many unrelated call sites, rules are "too broad". Use a skill whose description carries the triggers, an AGENTS.md pointer, and short JSDoc on the relevant getters linking the doc.
- When a listed skill covers a task, load it before improvising. Hand-rolled versions of skill machinery have caused real misses.
- `skillOverrides` silently doesn't apply to plugin skills. To stop auto-invocation, add `disable-model-invocation: true` to the plugin's SKILL.md (reverts on plugin update) or use a PreToolUse hook on `Skill`.
- Cursor's `@file` include doesn't work inside `.mdc` rule bodies. Make the `.mdc` body a sentence pointing at the `.claude` copy.
- Superpowers was uninstalled on purpose. Don't reinstall it or run `npx skills add`.
