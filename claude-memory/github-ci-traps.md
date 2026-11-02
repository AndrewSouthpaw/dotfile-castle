---
name: github-ci-traps
description: Conflicting PRs dispatch no CI; PR checks run on the merge ref against their own base, so stale stacks fail lint upstack
metadata:
  type: reference
---

- When `mergeable` is `CONFLICTING`, GitHub never computes the merge ref, so no check suites dispatch. Everything sits `queued`. Diagnose with `gh pr view <N> --json mergeable,mergeStateStatus`. Re-requesting suites, toggling labels, or empty commits don't help. Only resolving the conflict does.
- `actions/checkout` on `pull_request` checks out `refs/pull/N/merge`, the PR merged into its own base. In a stack on a stale trunk, the bottom PR sees current main but upper PRs merge into stale branches. A repo-wide lint then fails upstack on a file nobody in the stack touched. Restack onto current main, don't commit the formatting fix.
- Mass job cancellations at an identical timestamp across unrelated workflows are infra cancels. Re-run, don't debug the diff.
- A required unit job `cancelled` while sibling E2E jobs still run: `gh run cancel`, then `gh run rerun --failed` instead of waiting.
