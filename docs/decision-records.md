# Decision Records (ADRs)

This document defines how Architecture Decision Records (ADRs) are used in `engineering-standards`.

ADRs exist to capture **why** a standards decision was made so future changes remain consistent and intentional.

---

## ✅ Required — When to write an ADR

Write an ADR when you are making a change that affects any of the following:

- A new **Required** standard is introduced
- A **Required** standard is changed or removed
- A standards enforcement approach changes (linting/formatting/workflow)
- A repository-wide baseline convention changes (naming, docs structure, Git workflow)
- Tooling baselines are added or materially changed (ESLint/Prettier/VS Code)
- A decision will likely be questioned later (“Why did we choose this?”)

If the change impacts multiple repos or long-term maintainability, it deserves an ADR.

---

## 🟡 Recommended — When an ADR is not needed

You typically do NOT need an ADR for:

- typos
- minor clarifications with no behavioral change
- adding Optional examples
- reorganizing docs without changing meaning

---

## ADR Naming and Numbering (✅ Required)

ADRs live in:

```
adr/
```

Format:

```
NNNN-short-decision-title.md
```

Example:

```
0002-adopt-structured-commit-messages.md
```

Numbering is sequential and never reused.

---

## ADR Template (✅ Required)

Each ADR must contain:

- Title
- Status (Proposed | Accepted | Superseded | Deprecated)
- Context
- Decision
- Consequences
- Alternatives considered (optional but recommended)

---

## Status Rules (✅ Required)

- **Proposed**: drafted but not adopted yet
- **Accepted**: active decision
- **Superseded**: replaced by a newer ADR (must link to replacement)
- **Deprecated**: decision is no longer recommended but may exist historically

---

## Linking ADRs to docs (🟡 Recommended)

When a decision affects standards in `docs/`, update the relevant doc and add a short reference line such as:

> Decision rationale recorded in ADR-0002.

---

## Definition of Done (ADRs)

An ADR is complete when:

- it clearly explains the problem and decision
- it describes tradeoffs and consequences
- it is committed alongside the standards change it documents
