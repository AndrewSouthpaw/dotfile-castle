---
name: heavy-mcp-via-sonnet-subagent
description: Token-heavy MCP calls (Linear, New Relic/observability) run in a Sonnet subagent, never the main Fable thread
metadata:
  type: feedback
---

Linear and observability (New Relic) MCP calls go through a subagent with `model: "sonnet"`, reads included. The main thread drafts exact parameters and the subagent reports back only the result.

**Why:** Andrew asked after watching the cost: one Linear create plus confirm ran ~70k tokens. For New Relic: "You're not allowed as fable to EVER use newrelic." He moved both to Sonnet on 2026-10-28.

**How to apply:** Draft ticket text or NRQL in the main thread, hand it over verbatim, and have the subagent confirm fields landed and return identifiers, URLs, or quoted rows.
