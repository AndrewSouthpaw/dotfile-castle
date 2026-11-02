---
name: yagni-kill-speculative-options
description: Delete rarely-correct opt-ins and escape hatches instead of keeping them as non-default options
metadata:
  type: feedback
---

When a config flag or mode has one clearly-correct value in practice, hardcode it and delete the alternative: the type union, the branches, the tests. Andrew: "just never allow it. kill the opt-in. YAGNI, can add later." I had proposed flipping the default.

**Why:** Unused options are surface area to misuse and maintain. Re-adding later is cheap.

**How to apply:** Don't preserve the escape hatch "just in case".
