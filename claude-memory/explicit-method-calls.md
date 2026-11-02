---
name: explicit-method-calls
description: Call `singleton.method()` at callsites instead of exporting bound convenience functions
metadata:
  type: feedback
---

Prefer `singleton.method(...)` at callsites over exporting `const method = singleton.method.bind(singleton)` or an arrow wrapper.

**Why:** Andrew: "I don't like closing over random methods." The receiver stays visible at every callsite, so swapping the instance is mechanical and the coupling is honest.

**How to apply:** If a plan proposes a top-level wrapper around a singleton's method, propose the method call instead.
