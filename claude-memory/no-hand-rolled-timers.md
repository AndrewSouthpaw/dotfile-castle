---
name: no-hand-rolled-timers
description: No per-entity setTimeout bookkeeping; use or build one tested timing abstraction
metadata:
  type: feedback
---

Don't write per-id settle or linger timers in presenters, repos, or services. Andrew: "definitely don't want a lot of hand-holding timers, make sure there's an abstraction we use for it."

**Why:** Timer-per-entity bookkeeping is untestable without fake-timer choreography in every consumer.

**How to apply:** Before any `setTimeout` in app logic, look for an existing abstraction (an expiring id set, a grace-period flag, a timeout scheduler). If none fits, build a value object with its own fake-timer tests and have the consumer make one call.
