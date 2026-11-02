---
name: ddd-architecture-tenets
description: Andrew's DDD-lite doctrine - models first, repos hold queries, stateless noun-named services, presenters; no Clean layers, CQRS, or event sourcing
metadata:
  type: reference
---

For "where should this logic live" questions, Andrew's architecture taste (from the DDD and 2.0 architecture docs he wrote at Gather):

- Ubiquitous language: name code after the domain's words.
- **Models first.** A rich model is the first place business logic goes.
- **Repos** map storage to rich models and hold the query methods.
- **Services** are stateless and coordinate across several repos or models when no single owner exists. Noun names are fine and no `Service` suffix is needed (`UserSignup.byInvite`).
- **Presenters** connect the view layer to business logic.
- Value objects and aggregates where they earn it. Helper bags of loose functions are the thing to replace.
- Explicitly skipped: layered/Clean architecture (controllers may touch models directly), CQRS, event sourcing, domain events, specifications, factories by default. Don't use "application layer" vocabulary.
- Performance-critical code (serialization codecs, row transforms, per-request or per-message paths) keeps free functions and primitives. Don't push OOP or value objects there unless the restructure is free. A plain `string` id isn't a value-object candidate by itself.

**How to apply:** Before presenting a plan, map each new file to one of these blocks. Anything that doesn't map gets redesigned. Related: [[yagni-kill-speculative-options]], [[explicit-method-calls]].
