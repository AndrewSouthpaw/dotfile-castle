---
name: jest-gotchas
description: Test running and assertion preferences, plus Jest/Fishery/pg/eslint traps
metadata:
  type: reference
---

**Running**

- Run only the specific test files you changed or added, never a bare or repo-wide sweep. Andrew's machine can't handle the load. Ask if broader coverage seems warranted, don't run it.
- Read full test output (at least `| tail -50`) before filtering. Grepping once hid the real `TypeError` behind a timeout.

**Assertions**

- `.toEqual()` over `.toBe()`. Reserve `.toBe()` for identity.
- `const res = await fn()` then `expect(res).toEqual(...)`, not `.resolves`. `.rejects.toThrow` is fine.
- Don't add `jest.clearAllMocks()`/`restoreAllMocks()` in hooks when the config already sets `clearMocks`/`restoreMocks`.

**Traps**

- Fishery merges an explicit `undefined` over the factory default. Omit the key instead of passing `k: undefined`.
- `react-hooks/rules-of-hooks` treats any `use[A-Z]` name as a hook. For a non-hook helper called from a named function, alias the import. An eslint-disable gets stripped by `--fix`.
- `jest.useFakeTimers()` fakes `process.nextTick`, which hangs `pg-pool`. Use `{ doNotFake: ["nextTick"] }` in DB-backed tests.
- Prisma with `@prisma/adapter-pg` sends raw query params untyped. Write `${id}::uuid`, not `UUID(${id})`.
- Mocha runs a root-level `beforeEach` before each test but not before `before`/`beforeAll`.
- A fail-on-console check gated on `process.env.CI` passes locally and fails in CI.
