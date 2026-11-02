---
name: gitignore-over-git-exclude
description: Untrack files via the committed .gitignore, not .git/info/exclude
metadata:
  type: feedback
---

To untrack a file, even a personal one like `CLAUDE.local.md`, add the pattern to the committed `.gitignore`, not `.git/info/exclude`.

**Why:** Andrew prefers visible, conventional ignores. The committed entry tells the team the pattern is expected to be personal.

**How to apply:** Default to `.gitignore`. Use `.git/info/exclude` only when asked.
