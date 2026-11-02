---
name: reverify-after-autofix
description: A pre-commit autofix can rewrite staged code; verify the committed bytes, not the pre-commit ones
metadata:
  type: feedback
---

If the commit hook runs `eslint --fix` or prettier, a typecheck you ran before committing checked the pre-autofix code. It proves nothing about what got committed.

**Why:** An autofix once rewrote a call without adding its import. I reported green on the pre-autofix version and pushed a broken commit. Andrew: "not up to standards."

**How to apply:** After a commit whose hook reports applying modifications, re-read the changed files or re-run the typecheck. Also check that any `// eslint-disable-next-line` still sits directly above its statement after prettier reflows a long line (see [[prettier-eslint-disable-reflow]]).
