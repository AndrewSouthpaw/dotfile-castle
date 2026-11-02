---
name: temp-files-location
description: Temp files go in the repo's gitignored scratch dir, named YYYY-MM-DD-<ticket>-<slug>; resolve the root with git
metadata:
  type: feedback
---

Write plans, progress logs, dumps, and scratch output to the repo's gitignored scratch directory (set this per project), named `YYYY-MM-DD-<ticket>-<short-slug>.<ext>`.

**Why:** The date sorts chronologically and the ticket prefix scopes each file, so Andrew can triage a long-running scratch area. The session scratchpad and `/private/tmp` get wiped on reboot, which once lost spike code.

**How to apply:** Resolve the repo root with `git rev-parse --show-toplevel`. Never assemble it from the cwd: under `.superset/worktrees/<uuid>/<owner>/<slug>`, truncating to the uuid writes one level above the repo, where nobody finds it. Use the ticket's team prefix. Don't keep work in the session scratchpad.
