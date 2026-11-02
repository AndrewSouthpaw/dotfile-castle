---
name: relocate-then-reorganize
description: Move code in one PR with paths and names untouched, then restructure in a follow-up
metadata:
  type: feedback
---

When extracting code into a new module or directory, plan two PRs: first a pure relocation (internal names and relative paths unchanged, only external rewiring), then the internal reorganization.

**Why:** Andrew asked for this split unprompted. A path-preserving move has no content edits to review, and the restructure diff is legible on its own. Bundling them hides real edits in rename noise.

**How to apply:** Propose the split yourself. Note which PR carries side effects (e.g. a script removal that changes a build fingerprint). New modules mirror the closest existing sibling's shape rather than a bespoke layout. Related: [[pr-stack-splitting]].
