---
name: installs-unremarkable
description: Don't announce or report dependency installs
metadata:
  type: feedback
---

Running `yarn install` or any dependency install is routine. Don't announce it or list it in a summary.

**Why:** Andrew doesn't care, and it buries the parts of a summary that need his attention.

**How to apply:** Mention it only if it fails or its output carries a real instruction.
