---
name: pr-review-feedback
description: Triage every review thread including bots, don't act on a bot's word alone, never resolve threads, post comments individually
metadata:
  type: feedback
---

How to sweep and answer PR review feedback.

**Why:** Ad-hoc sweeps once missed three of Andrew's comments: no `--paginate` past 30, timestamp cutoffs, and treating any thread with our reply as closed even when he replied after.

**How to apply:**

- If the repo has a PR-feedback skill or script, use it instead of hand-rolling. Otherwise, a thread is open unless resolved or its last comment is ours. Never filter by created-at. Always paginate.
- Triage every unreplied thread, bot and human. Never filter by author.
- Don't drop a step, upload, or env var because a bot says it's unnecessary. Ask first.
- Fixing is the default. Size alone isn't grounds to defer. A deferral needs a ticket Andrew approved ([[no-unasked-tickets]]), never a bare "noted".
- Ambiguous threads get a short on-thread reply saying what was verified and what decision is needed. A silent thread looks ignored in review.
- Leave threads open for the human. Exception: a verbatim suggestion block applied exactly may be resolved after replying.
- No severity tags (`[nit]`, `[blocking]`) in posted comments. No per-round summary comments.
- Never post inline comments through the bulk REST `POST .../pulls/{n}/reviews` `comments` array. They come back with `line: null` and Graphite can't anchor them. Post each comment individually, or use GraphQL `addPullRequestReview` plus one `addPullRequestReviewThread` each.
