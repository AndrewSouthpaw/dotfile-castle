---
name: pr-atomicity-over-commit-tidiness
description: Judge a PR by whether it does one thing; never propose rebasing or squashing for tidy history
metadata:
  type: feedback
---

A commit plus its revert, a fixup, a hygiene commit on top: all fine. Never propose rebasing, squashing, or dropping commits to make history neater.

**Why:** Andrew: "commit pairs are fine, it's the PR atomicity that matters. always." Reviewers read the PR diff. Rewriting published branches is risk for cosmetics.

**How to apply:** Say nothing about untidy commits. Flag a PR whose scope isn't one coherent change instead. Related: [[pr-stack-splitting]].
