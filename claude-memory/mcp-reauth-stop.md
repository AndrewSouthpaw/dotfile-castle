---
name: mcp-reauth-stop
description: When an MCP server needs reauth or is disconnected, stop and ask Andrew to reconnect instead of routing around it
metadata:
  type: feedback
---

On an MCP auth or disconnect error, stop and ask Andrew to reconnect, then resume.

**Why:** He'd rather reauth on the spot than have a step silently skipped.

**How to apply:** Surface the error immediately. Don't skip the step or find a workaround.
