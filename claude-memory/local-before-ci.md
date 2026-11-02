---
name: local-before-ci
description: Get it working locally first; CI confirms, it doesn't discover
metadata:
  type: feedback
---

Run the tests you touched locally before submitting. CI is confirmation, not the feedback loop.

**Why:** I once submitted E2E specs I'd never run, checking the box because CI would run them. They failed and the CI round trips cost hours that one 3-minute local run would have saved. CI existing is not CI passing.

**How to apply:** Only check a test-plan box for a step you actually performed. Related: [[pr-conventions]].
