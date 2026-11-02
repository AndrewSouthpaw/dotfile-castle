---
name: write-like-andrew-skill
description: The write-like-andrew skill lives in the repo at .claude/skills/write-like-andrew; run the skill and its scorer, and which samples are and aren't Andrew's voice
metadata:
  type: reference
---

The skill's canonical copy is in the repo at `.claude/skills/write-like-andrew/` (SKILL.md, guidance.md, exemplars.md, eval.md, tests/). The scorer is `node .claude/skills/write-like-andrew/tests/score.ts <draft.md>` and exits 1 on a banned phrase, a semicolon, the `…` character, two em dashes in one paragraph, or an over-long sentence. Fix every line it prints. Keep one copy only: a stale duplicate under `~/.claude/skills` once shadowed it in the `/` picker.

**Why:** Andrew on a PR body I didn't score: "your pr desc doesn't sound like me." Never ship prose he signs without running both.

**How to apply:**

- `exemplars.md` holds his real verdicts on agent comments, mostly "delete comment". The deletion test settles most comment rewrites before any prose gets written.
- Semicolons and clause-stacking are the main tells. His prose has about one semicolon per several thousand words, and agent output about one per hundred.
- Agents copy abstraction vocabulary straight out of tickets and plans ("owns", "lifetime", "outlives"). He almost never uses those words. Grep for coined terms before using them.
- Not his voice: PR bodies with an `## AI Slop Details` heading, and review comments prefixed `[felix]`. Don't mine them as style samples.
- Still his voice: his own design docs, his pre-2025 hand-written PR bodies, and his review comments without a bot prefix.

Related: [[write-like-andrew-everything]], [[prose-voice]].
