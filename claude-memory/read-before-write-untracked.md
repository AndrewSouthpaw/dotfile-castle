---
name: read-before-write-untracked
description: Read the exact path before overwriting gitignored or untracked files; worktree copies differ
metadata:
  type: feedback
---

Before writing a gitignored or untracked file, read that exact path. The worktree copy and the main checkout copy can differ.

**Why:** I overwrote Andrew's real `CLAUDE.local.md` in the main checkout after only checking the empty worktree copy.

**How to apply:** Never infer a file's contents from a different location.
