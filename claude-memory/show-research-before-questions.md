---
name: show-research-before-questions
description: Put code facts and the question's premise in the same visible message as the question; context-heavy questions go in plain text
metadata:
  type: feedback
---

When asking Andrew to choose, show the research first: what the code does today (file:line), what the question hinges on, then the question.

**Why:** Questions asked with the evidence hidden left him unable to judge options. When the AskUserQuestion UI renders, the preceding text is out of view: "SHOW THE FUCKING CONTEXT."

**How to apply:** For context-heavy decisions, ask in plain text at the end of the final message, with no AskUserQuestion. Reserve the tool for self-explanatory options. Keep the research in one block in the same message, not scattered between tool calls. Repeat the premise when re-asking. Related: [[one-question-until-closed]].
