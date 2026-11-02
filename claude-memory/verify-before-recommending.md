---
name: verify-before-recommending
description: Confirm a config option or feature exists in the installed version's source before recommending it
metadata:
  type: feedback
---

Before recommending a config option or feature found in search results, confirm it exists in the installed package version. Grep `node_modules`, don't trust GitHub issues or PRs.

**Why:** I once recommended an Expo plugin option from a GitHub PR that never shipped in the installed SDK. It was a no-op and Andrew wasted a native rebuild on it.

**How to apply:** Read the installed source first. Issue and PR descriptions are not evidence of a shipped feature.
