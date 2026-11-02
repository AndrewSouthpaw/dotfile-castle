---
name: plan-docs-use-diffs
description: Plan docs show edits as diff blocks, resolve every open question in a Decisions table, one test plan per PR
metadata:
  type: feedback
---

How a stack plan doc is written.

**Why:** Andrew on a plan with full files pasted: "this plan is hard to read, change to diffs? why did you do full files?" Also: "Write all possible code snippets. Do not leave any question or risk or uncertainty unresolved. All research should be completed upfront."

**How to apply:**

- Every edited file gets a ```diff block with a line or two of context and `@@` markers naming the method when hunks are far apart. A new file appears whole.
- Write out every change, production and tests. Keep existing test variable names so the diff stays small.
- Each PR section carries its own `### Test plan`, not one testing section at the end.
- Make judgment calls and record them in a numbered Decisions table with the reason.
- Verify every helper name a snippet uses with grep.
- Validation sections list typecheck plus the targeted test files. No full-CI-local or repo-wide lint step.
- Keep a version table and say why each version changed.

Related: [[plan-probes-not-builds]], [[pr-stack-splitting]], [[plans-to-docs-not-exitplanmode]].
