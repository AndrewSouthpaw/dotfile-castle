---
name: no-secret-values-in-session
description: Secret managers - list names only, never print values into the transcript
metadata:
  type: feedback
---

Listing secret names (`doppler secrets --only-names`, `doppler configs`) is fine. Never run anything that prints a value: `secrets get`, `secrets download`, `doppler run` with output.

**Why:** Output lands in the transcript. Andrew confirmed names are reasonable.

**How to apply:** If a plan needs a value, write "verify in Doppler" or ask Andrew to run it with `!`. Per-service configs can carry keys the root config lacks, so check the one the target loads. Same care for any dump holding a password (delete after reading, never print).
