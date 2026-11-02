---
name: prettier-eslint-disable-reflow
description: Prettier reflow can move code out from under an eslint-disable-next-line, passing locally and failing CI
metadata:
  type: reference
---

When prettier wraps a long statement under `// eslint-disable-next-line <rule>`, the disable lands on the wrapper line and the rule fires on the real code. It passes the pre-commit check and fails in CI on the formatted file.

**How to apply:** After any reformat touching a disabled line, confirm the disable still sits directly above the offending statement. For long statements, use a `/* eslint-disable <rule> */ ... /* eslint-enable <rule> */` pair. Related: [[reverify-after-autofix]].
