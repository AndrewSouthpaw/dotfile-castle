---
name: pr-draft-state-human-owned
description: Never flip a PR between draft and ready; if the state looks wrong, read the timeline and report
metadata:
  type: feedback
---

A PR's draft/ready state belongs to Andrew. Never run `gh pr ready`, `gh pr ready --undo`, or any state flip unless he asked in the current session.

**Why:** Agents once flipped 22 of his deliberately published PRs back to draft, each time wrongly inferring that `gt submit` had published them. `gt submit` never changes an existing PR's state.

**How to apply:** If the state surprises you, read `gh api repos/OWNER/REPO/issues/N/timeline` for `ready_for_review`/`convert_to_draft` timestamps, then report. Never "correct" it. The actor login proves nothing, since agents act as Andrew.
