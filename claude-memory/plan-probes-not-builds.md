---
name: plan-probes-not-builds
description: While planning, probe single facts in scratch; never build the PRs, not even as throwaway commits
metadata:
  type: feedback
---

While writing a plan, a probe answers one question: a scratch script, a one-off generate, a typecheck of a single change. Write the plan's diffs by hand from reading the code.

**Why:** I once had a subagent commit five planned PRs in a detached worktree to get "validated diffs". Andrew stopped it: "looked like you were building the actual pr".

**How to apply:** Probe only what the code can't answer (error shapes, generator output, whether a CLI flag exists), record the finding in the doc, delete the scratch. Never fan out agents to implement during planning.
