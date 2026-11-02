---
name: pr-stack-splitting
description: Split stacks by move, rename, and behavior kind; collapse same-shaped edits; tests for a new feature ship with it
metadata:
  type: feedback
---

How far to split a PR stack.

**Why:** Andrew: "any files that get moved have that be a separate PR. Any renames... a separate PR. This will allow us to sift apart the more substantial changes from simple moves and replaces." Later corrections pulled it back from overkill: "`Read x from y in z1`, `Read x from y in z2` was too much, you could've collapsed into `Read x from y`."

**How to apply:**

- Every file move, every rename, and every distinct behavior change is its own PR. Order: moves and renames, then fixes, then features, then adoption.
- Ask whether a rename is needed at all. A rename PR that buys nothing is churn.
- Split by behavior and wiring kind, not by file. Identical mechanical edits across files ship as one PR titled for the change.
- Tests for new behavior ship in the feature's PR. "If you're just adding tests for the new feat, then merge the two PRs together." Tests for existing behavior go in their own PR below the change.
- Sub-steps of one cleanup with the same goal and files are one PR ("useless splitting" otherwise).
- A domain piece whose only caller lands one PR up is half an idea. Merge them.

Related: [[refactor-prs-no-test-changes]], [[relocate-then-reorganize]], [[pr-atomicity-over-commit-tidiness]].
