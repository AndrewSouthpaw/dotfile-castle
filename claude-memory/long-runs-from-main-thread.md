---
name: long-runs-from-main-thread
description: Background commands started in a subagent die when it finishes; start long runs from the main thread
metadata:
  type: reference
---

A `run_in_background` command started inside a subagent is killed when the agent finishes. Seen: an E2E suite died mid-boot and the agent's final answer was "waiting on the stages".

**How to apply:** Start 15-minute-plus runs from the main thread with `run_in_background: true` so the harness notifies on exit. If a subagent must own the run, tell it to poll until it has a result and never finish while a run is in flight. Related: [[delegate-testing-to-subagent]].
