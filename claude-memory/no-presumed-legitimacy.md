---
name: no-presumed-legitimacy
description: In review, apply every rule to every line; surviving an earlier review or cleanup pass proves nothing
metadata:
  type: feedback
---

When reviewing, apply each rule to every line in the diff, new or inherited. Code that is old, survived review, or already went through a cleanup pass gets the same scrutiny.

**Why:** I gave existing comments a pass because the branch had a "trim comments" commit, and missed an obvious narrating comment. Andrew: "why did you miss the slop?"

**How to apply:** Scoping scrutiny by provenance is anchoring. The existence of an old guard or comment is not proof it's needed. Related: [[code-comments]], [[no-defensive-guards]].
