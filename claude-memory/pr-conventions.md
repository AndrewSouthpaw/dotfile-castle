---
name: pr-conventions
description: PR title format, body rules, how to refer to PRs, and truthful checkbox-only test plans
metadata:
  type: feedback
---

How a PR title and body read.

**Why:** Andrew's house style from direct corrections. Deviations miss required fields or read as AI noise.

**How to apply:**

- **Title:** `<type>: <Summary> [TICKET-123]`. Ticket tag is a suffix. Capitalize the summary's first word. No conventional-commit scope (`fix:`, never `fix(cli):`). Commit subjects can stay lowercase.
- **Body:** read the repo's PR template first. Never hard-wrap, one line per paragraph. Never open with "Stacked on top of #N". A pure relocation PR gets one paragraph plus the test plan.
- **Merge gates:** a PR with a merge-gate section gets a `[do not merge] ` title prefix. Removing it is Andrew's call.
- **Referring to PRs:** explicit numbers (`#123`) or upstack/downstack. Never invented ordinals like "PR 1" outside a plan doc. Link PRs, not commit SHAs. Prefer Graphite URLs (`https://app.graphite.com/github/pr/<org>/<repo>/<N>`) when the repo uses Graphite.
- **Test plan:** checkboxes only. No "CI checks" line, no test file lists, no pass counts. Check a box only for a step you actually performed, and re-run after any restack or cherry-pick that changes content. Never forge a gate's evidence by hand.
- Submit once validation passes, without asking, unless Andrew says no. New PRs land as drafts.

Related: [[no-coauthor]], [[pr-draft-state-human-owned]], [[local-before-ci]], [[prose-voice]].
