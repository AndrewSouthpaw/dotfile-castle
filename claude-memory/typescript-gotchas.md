---
name: typescript-gotchas
description: Return-only generics infer, `as const satisfies` over enums, annotations over `as`, tsgo and tsc diverge
metadata:
  type: reference
---

- **Callback generic inference.** If a generic appears in both a callback's parameter and its return type (`(b: Builder<T>) => T`), TS often infers `unknown`. Confine it to the return position (`(b: Builder<unknown>) => T`). Symptom: "Type 'unknown' is not assignable" inside the arrow body.
- **Enums.** Prefer `const X = {...} as const satisfies Record<string, string>` and `type X = (typeof X)[keyof typeof X]`. A `: Record<...>` annotation widens values and adds `| undefined` under `noUncheckedIndexedAccess`.
- **No type assertions.** Andrew's repos lint-ban `x as T`, tests included (`as const` is fine). Annotate the variable or use `satisfies`. For untyped mock args, pass the `unknown` straight into `expect(...)` matchers.
- **Static helpers.** A pure helper doesn't belong as a `static` on a class. Put it at module scope as a `const`.
- **tsgo vs tsc.** The preview compiler diverges both ways: tsgo fails where tsc passes, and tsc hits `TS2615 circularly references itself in mapped type` where tsgo passes (fixed by annotating return types of arrow class fields). If CI runs tsc, run tsc before pushing changes to generics, mapped types, or module augmentation.
