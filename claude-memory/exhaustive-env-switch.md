---
name: exhaustive-env-switch
description: Gate on environment with an exhaustive switch over all envs, not isLocal/isDev boolean chains
metadata:
  type: feedback
---

When code branches on environment, prefer an exhaustive switch over every env (`switchEnv({ local, test, dev, staging, prod })`) to boolean chains like `isLocal || isDev`.

**Why:** Andrew lost about a day to an auth `isLocal` check that silently failed to extend when a `test` env was added. Exhaustiveness makes the compiler fail until a new env is handled.

**How to apply:** Use it even when most arms share a value. Keep `isProd`-style booleans for one-off gates where a new env can't matter. If the project lacks the helper, propose adding one.
