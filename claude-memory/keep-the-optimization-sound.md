---
name: keep-the-optimization-sound
description: When a cache or memoization gives a wrong result, restore its invariant instead of disabling it
metadata:
  type: feedback
---

When a cache, memoization, or incremental build produces a wrong result, don't propose turning it off. Proposing `cache: false` for an nx lint-fix task got "that seems fundamentally wrong". The fix was making the task exit non-zero when it rewrote a file, since nx caches only successes.

**Why:** Disabling pays a permanent cost for a bug with a correct-by-construction fix, and usually means nobody named the invariant that made caching valid.

**How to apply:** State the invariant ("a cached entry means these inputs needed no work"), then find the cheapest change that restores it. Offer disabling only as a fallback with its cost measured.
