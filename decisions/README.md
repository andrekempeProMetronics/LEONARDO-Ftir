# Architecture Decision Records (ADRs)

Project-level decisions for **LEONARDO-Ftir** that set conventions, lock in tooling choices, or are hard to reverse later.

For decisions that affect more than one sub-project, write the ADR in `PROM-Portfolio/decisions/` instead. The existing `docs/04_Decisions/` folder holds project-internal architectural decisions and continues to use the `_Template.md` convention there.

## Convention

- One ADR per file. Filename: `ADR-NNNN-short-title.md` (zero-padded, sequential).
- Use `ADR-template.md` as the starting point.
- Status lifecycle: `Proposed` → `Accepted` → (`Deprecated` | `Superseded by ADR-XXXX`).
- Once `Accepted`, do not edit the body — write a follow-up ADR that supersedes it instead.

## When to write an ADR

- The decision is hard to reverse later (data format, library choice, vendor lock-in).
- The decision sets a convention that other contributors should follow.
- Future-you would want to know *why* the choice was made, not just *what* was chosen.

## Index

_None yet. First ADR will be `ADR-0001-…`._
