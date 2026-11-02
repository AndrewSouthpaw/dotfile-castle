---
name: delegate-testing-to-subagent
description: In orchestrator sessions, smoke testing, env repair, and browser driving go to a subagent
metadata:
  type: feedback
---

When a session is set up as "subagent implements, main thread reviews", hand-on work stays delegated: smoke tests, environment repair, browser driving.

**Why:** Andrew interrupted a main thread driving Playwright itself: "you should be having a subagent drive testing right?" Burning main context on tool-driving defeats the setup.

**How to apply:** Send validation work back to the implementing subagent or spawn one. Main thread reads reports and makes calls. Related: [[long-runs-from-main-thread]].
