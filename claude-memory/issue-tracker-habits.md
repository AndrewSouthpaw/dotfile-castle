---
name: issue-tracker-habits
description: How to read and file Linear tickets - read comments too, Triage state, no priority, siblings over subissues, via a Sonnet subagent
metadata:
  type: feedback
---

How to work with Linear once Andrew asks for a ticket.

**Why:** Accumulated corrections. Comments often carry a revised plan that supersedes the description, and nested subissue trees made tickets hard to find.

**How to apply:**

- Always read comments alongside the issue.
- New issues go in the Triage state (or the team's equivalent), never Backlog. Omit priority, Andrew sets it.
- Follow-ups are siblings of the source ticket (same parent and project, plus `relatedTo`), not subissues.
- Ask which project if context points somewhere unusual.
- `save_issue` replaces the whole description. Re-fetch first ([[refetch-before-overwrite]]).
- Setting `duplicateOf` clears every `relatedTo`. Record them, save with only `duplicateOf`, then restore the links in a second save.
- Render ticket ids in prose as markdown links. Titles and commit subjects keep the plain tag.
- Large docs (hundreds of lines) fail as a Linear Document body. Upload as an attachment (`prepare_attachment_upload`, `curl -X PUT`, `create_attachment_from_upload`) and save a short pointer doc. To attach a URL, use `save_issue`'s `links` field.
- Run Linear calls in a Sonnet subagent ([[heavy-mcp-via-sonnet-subagent]]).
