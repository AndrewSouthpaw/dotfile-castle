---
name: worktrees
description: In a .superset/worktrees cwd, stay in that worktree; don't use the Agent tool's worktree isolation
metadata:
  type: feedback
---

When the cwd contains `.superset/worktrees/`, Superset already made the worktree for this conversation. Don't ask about base branches, don't create another worktree, don't fall back to the main checkout. If the work belongs on another branch, check it out here. Andrew: "you should just be staying this worktree, the one in superset."

**Why:** A subagent once built a fresh worktree for another branch, paying 10 minutes of `yarn install` that a checkout would have done in a second, outside the directory he was watching.

**How to apply:** Outside Superset, short-lived code PRs go on a branch in the main checkout. Skill and doc edits, long parallel work, or an explicit ask justify a worktree. Don't use the Agent tool's `isolation: "worktree"`: it leaked changes into the main tree. All worktrees share one `.git`, so local `main` only moves on an explicit fetch (`git fetch origin main:main`). Related: [[superset-workspace-names]], [[graphite-gotchas]].
