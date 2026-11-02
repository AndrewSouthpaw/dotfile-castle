---
name: refactor-prs-no-test-changes
description: A refactor PR changes tests only as much as the refactor forces; new coverage goes in a separate PR
metadata:
  type: feedback
---

A refactor PR touches tests only for renamed symbols and moved imports. It never adds or deletes a test case or a test file.

**Why:** Andrew: "Make sure refactors like these don't add or remove tests... if more test coverage is necessary, add them in a separate PR." A reviewer reads a refactor as "same behavior", and a test diff beside it hides whether behavior moved.

**How to apply:** New cases go in a `test:` PR right above the refactor, or into the `feat:` PR that uses the code. Exception: tests of the API the refactor itself introduces (type tests for a new type, say) ship in the refactor, since they can't pass below it. Related: [[pr-stack-splitting]].
