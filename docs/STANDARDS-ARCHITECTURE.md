# Engineering Standards Architecture

## Purpose

This document defines the architecture and operational model of the
engineering-standards system.

It explains how standards are defined, distributed, enforced, and propagated
across repositories.

This architecture ensures:

- Deterministic standards enforcement
- Safe and reproducible standards propagation
- Elimination of standards drift
- Consistent tooling and development environments

---

## Core Architecture Model

The engineering standards system follows a three-layer model:

1. Authority Layer
2. Mirror Layer
3. Enforcement Layer

These layers form a controlled propagation chain.

---

## Authority Layer

Location:

engineering-standards/config/

Purpose:

Defines the canonical source of truth for all engineering standards.

Examples:

- Prettier configuration
- ESLint configuration
- VS Code configuration
- cspell dictionary
- commit templates

Properties:

- Must never be modified outside engineering-standards repository
- All standards changes originate here
- Version-controlled and auditable

This layer represents the baseline authority.

---

## Mirror Layer

Location:

repository/config/

Purpose:

Provides a local mirror of the standards authority inside each standardized
repository.

Examples:

- repository/config/prettier/
- repository/config/eslint/
- repository/config/vscode/

Properties:

- Mirrors engineering-standards/config/
- Provides auditability of standards version at time of adoption
- Enables safe propagation of future standards updates
- Must not diverge intentionally from authority layer

This layer ensures reproducibility and traceability.

Rationale:

Without a mirror layer, repositories would depend on external state. The mirror
ensures each repository contains a complete, self-contained snapshot of the
standards baseline.

---

## Enforcement Layer

Location:

repository/.vscode/
repository/.prettierrc.json
repository/.prettierignore
repository/eslint.config.mjs (or equivalent)

Purpose:

Actively enforces standards during development.

Examples:

- Editor formatting rules
- Spell checking dictionary
- Linting rules
- Formatting rules

Properties:

- Consumed by editor and tooling
- Controls real-time developer experience
- Must remain synchronized with mirror layer

This layer represents active operational enforcement.

Rationale:

Authority defines standards. Mirror preserves standards. Enforcement applies
standards.

---

## Standards Propagation Flow

Standards changes propagate through layers in a strict sequence:

1. Authority update
   engineering-standards/config/

2. Standards repo enforcement sync
   engineering-standards/.vscode/

3. Repository mirror sync
   repository/config/

4. Repository enforcement sync
   repository/.vscode/

This propagation ensures consistency and prevents standards drift.

Propagation is automated using:

scripts/sync-standards.sh

Example usage:

```bash
./scripts/sync-standards.sh ../target-repository
```

This script updates both mirror and enforcement layers safely.

---

## Repository Initialization Flow

New repositories are initialized using:

scripts/init-standards-repo.sh

Example usage:

```bash
mkdir ../new-repository
./scripts/init-standards-repo.sh ../new-repository
```

This script performs:

- Authority mirror creation
- Enforcement layer creation
- Prettier baseline activation
- README creation with standards declaration
- Git initialization
- Commit template activation
- Initial baseline commit

This ensures new repositories begin fully compliant.

Safety properties:

- Refuses to run on non-empty directories
- Prevents accidental overwrites
- Ensures deterministic repository state

---

## Standards Lifecycle

Standards follow a controlled lifecycle:

1. Define or update standards in engineering-standards/config/

2. Sync enforcement layer inside engineering-standards repository

3. Propagate standards using sync script to target repositories

4. Commit propagated changes in each repository

5. Standards become active immediately in development environments

This lifecycle ensures safe, traceable evolution of standards.

---

## Upgrading Standards in Existing Repositories

When engineering standards are updated in engineering-standards/config/,
the changes must be propagated to each standardized repository to prevent
drift.

### Standard Upgrade Procedure

1. Update standards in the authority layer:

```bash
- engineering-standards/config/
```

1. Sync enforcement inside the standards repository so local validation uses
   the new baseline:

Run:

```bash
cp config/vscode/cspell.json .vscode/cspell.json
```

(Repeat for any enforcement files as needed.)

1. Propagate updates to a target repository using the sync script:

Run:

```bash
./scripts/sync-standards.sh ../target-repository
```

1. Commit changes in the target repository:

Run:

```bash
git add config .vscode git .github
git commit -m "chore(standards): sync baseline standards"
git push
```

### Notes

- Syncing updates refreshes both the repository mirror (`config/`) and
  enforcement layer (`.vscode/`).
- Always review git status before committing to confirm only expected files
  changed.
- The sync script is safe to run multiple times and is designed to be
  repeatable.
- All standardized repositories should periodically sync to remain aligned
  with the authority baseline.

## System Guarantees

This architecture guarantees:

- Deterministic standards propagation
- Reproducible development environments
- Safe repository initialization
- Safe standards evolution
- Full auditability through version control

This architecture eliminates configuration drift and ensures consistent
engineering environments.
