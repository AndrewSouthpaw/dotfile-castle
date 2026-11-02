---
name: no-defensive-guards
description: Write the plain expression; add optional chaining or typeof guards only after verifying the bare form is unsafe
metadata:
  type: feedback
---

Don't reach for `a?.b?.c` or `typeof x !== "undefined"` defensively. Andrew: "dont use optional chain, that's dumb and standard."

**Why:** Guards read as noise and often protect a case that can't happen. The bundler or runtime frequently already makes the bare read safe.

**How to apply:** Write the bare expression. Before guarding, check the actual build or runtime behavior to prove it's unsafe. Related: [[verify-before-recommending]], [[no-presumed-legitimacy]].
