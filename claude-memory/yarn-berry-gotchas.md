---
name: yarn-berry-gotchas
description: Yarn 4 drops args after `--` in `yarn workspace`, root scripts shadow binaries, avoid `yarn run -TB`
metadata:
  type: reference
---

- `yarn workspace <ws> <script> -- <args>` silently discards everything after `--` and runs unfiltered. Use `yarn workspace <ws> run <script> <args>`. Found when a `--list` dry run executed a whole E2E suite.
- Yarn resolves scripts before binaries. If the root defines a `prettier` script, `yarn prettier <file>` runs that script with your args appended (a whole-repo format that looks like a hang). Use `./node_modules/.bin/<bin>` or `yarn exec <bin>`.
- Avoid `yarn run -TB <bin>` to reach a root-only binary. Andrew: "try to avoid -TB unless it's required." Declare the providing package in that workspace's devDependencies.
