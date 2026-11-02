---
name: log-stack-as-attribute
description: Keep error stacks out of the log message; put them in a stack attribute so logs group
metadata:
  type: reference
---

Passing an Error to a logger that uses `util.format` renders `error.stack` into the message. Every occurrence becomes a unique multi-line string, so log tools (New Relic patterns, etc.) can't group them.

**How to apply:** One-line message plus the stack in a `stack` attribute. Never trim a stack from a message without adding the attribute in the same change, since APM `noticeError` may not preserve it.
