---
name: prose-voice
description: Long-form writing should be short, concrete, plain-worded; banned phrases; three dots not the ellipsis char; no hard-wrapped markdown
metadata:
  type: feedback
---

How PR bodies, tickets, design docs, chat replies, and skill files should sound.

**Why:** Andrew writes directly and is calibrating my voice to his. His words: "you're being quite verbose, could you say the same key points with fewer words?" He called one paragraph "SO complex, such big words and not conveying much."

**How to apply:**

- **Length.** Over ~150 words, draft then cut hard. One or two short sentences per point. Tables and tight bullets beat paragraphs. No transitions ("Let me walk through why..."). If deleting a sentence loses nothing, delete it.
- **Vocabulary.** Describe actions, not concepts: "Expo tells us later whether Apple accepted each push", not "asynchronous feedback channel". Don't abbreviate ("implementation", not "impl"). Don't dress a constraint up as a choice.
- **Numbers** are ones a person would know or round ("8000+ line file"). A machine-exact first-person tally is a tell. Round it, drop it, or attribute it ("According to AI analysis...").
- **Banned:** "byte-for-byte", "load-bearing", "soak" in any form (say bake, cook, or passively test).
- **Formatting.** Never the `…` character. Write three dots. Don't hard-wrap markdown paragraphs, since GitHub renders single newlines as `<br>` and Notion breaks on paste.
- One idea per sentence. Avoid semicolons.

Run the `write-like-andrew` skill and its scorer on anything Andrew signs ([[write-like-andrew-everything]], [[write-like-andrew-skill]]). Related: [[code-comments]].
