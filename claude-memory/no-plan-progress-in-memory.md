---
name: no-plan-progress-in-memory
description: Ticket plans, progress, PR numbers and CI state live in plan/progress docs, never in memory
metadata:
  type: feedback
---

Don't use memory for a ticket's progress, plan path, stack, PR numbers, or CI state. Those live in `<date>-<ticket>-<title>-{design,plan,progress}.md` docs in the repo's scratch area.

**Why:** Andrew: "don't use auto-memory to store progress about a linear ticket; put that in a -progress file instead." A memory that mirrors the docs goes stale.

**How to apply:** Glob for the docs by ticket id. Create the progress doc when building starts. If nothing matches, ask for the path. Durable lessons that outlive the ticket still become feedback or reference memories. Related: [[temp-files-location]].
