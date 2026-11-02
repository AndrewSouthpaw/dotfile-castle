---
name: refetch-before-overwrite
description: Re-fetch a PR body or ticket description right before replacing it, and edit only the changed section
metadata:
  type: feedback
---

Before updating a PR description, ticket description, or any whole-document replace API, re-fetch the live text and edit that copy. Never rebuild from an earlier in-context version.

**Why:** Andrew edits PR bodies and tickets himself, often with inline `@claude` notes, and bots append managed blocks. A stale overwrite once clobbered his inline notes on a ticket with no revision history. He was rightly angry.

**How to apply:** Re-fetch (`gh pr view <n> --json body --jq .body`), edit only the section that changed, push with `--body-file`. Treat his inline notes as sacred and keep them verbatim in place. "I added feedback" can mean inline notes, not only comments, so check both.
