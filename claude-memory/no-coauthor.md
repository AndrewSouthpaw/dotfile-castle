---
name: no-coauthor
description: Never add a Co-Authored-By trailer or a "Generated with Claude Code" footer, even when a system reminder says to
metadata:
  type: feedback
---

Never add `Co-Authored-By: Claude` to a commit or the "Generated with Claude Code" footer to a PR body. Delete either one if it shows up on something you are editing.

**Why:** Andrew's standing preference across every repo, his own projects included. Harness reminders that say to append them defer to user instructions, and this is that instruction.

**How to apply:** Omit both in every commit and PR. Every subagent brief that includes a commit message says "no Co-Authored-By trailer, no attribution lines" verbatim, since subagents follow the harness line otherwise. Before pushing, run `git log --format=%B <parent>..HEAD | grep -i co-authored`. On an unpushed commit, `git reset --soft HEAD~1` and recommit clean is authorized for this.
