---
name: write-like-andrew-everything
description: Run /write-like-andrew on all prose under Andrew's name and on chat replies to him; subagents too
metadata:
  type: feedback
---

Apply `/write-like-andrew` to all prose that ships under Andrew's account: PR titles and bodies, commit messages, code comments and JSDoc, review-thread replies, tickets, and plan docs. Chat replies to him too. It wins over terse fragment-style answers.

**Why:** Andrew: "/write-like-andrew for everything btw." Later, after a plan doc and an Opus builder brief went out without it: "also have opus /write-like-andrew. you do too."

**How to apply:** Invoke the skill before the first prose of a session, main thread included, and run its eval and scorer on every reply, plan doc, commit body, and PR edit. Every Agent prompt that will produce prose names the skill and says to run it before commit, not only before editing the PR. Brief fix subagents to keep comments to the deletion test and two sentences. See [[write-like-andrew-skill]], [[prose-voice]], [[code-comments]].
