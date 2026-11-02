---
name: code-comments
description: Comments are two sentences max, explain why not history, sit at the line they describe, hazards use "would"
metadata:
  type: feedback
---

How code comments should read.

**Why:** Andrew and his reviewers repeatedly trim verbose comments. He called one "AI slop", and a reviewer flagged another as "redundant, you can infer from the name."

**How to apply:**

- `//` for single-line, `/** ... */` for multi-line. Wrap to the code's print width (check the prettier config), counting indentation and the comment marker. Re-wrap comments you touch, leave the rest.
- Two sentences per comment, hard cap. Most should be one. A rationale that needs five sentences belongs in the ticket or design doc, or the code needs a named helper.
- Deletion test: delete the comment and re-read. If the name, type, or code already says it, keep it deleted. No one-line JSDoc that restates the signature.
- Put a fact about one statement on the line above that statement, not in the function's doc header.
- Explain why, not how the code evolved. No "replaces Y", "an improvement over the old X".
- Hazards use the conditional mood: "a yield here would let a later frame publish first", not "lets". The indicative reads as a bug report.
- A comment explaining an external system's undocumented shape survives the deletion test even at a few lines.

Related: [[prose-voice]].
