# Engineering Standards Index

This documentation set defines the **baseline** engineering standards for all repositories that adopt `engineering-standards`.

**Baseline rule:** Repositories may extend these standards, but may not override anything marked **Required**.

---

## Contents

### Core standards

- **Repository standards** → `repo-standards.md`
  - required files
  - repository structure
  - branching and protection expectations (conceptual)
- **Git workflow and commit discipline** → `git-workflow.md`
  - commit message rules
  - PR expectations
  - review and merge discipline
- **Documentation standards** → `documentation-standards.md`
  - README expectations
  - docs layout
  - tone/format consistency
- **Naming conventions** → `naming-conventions.md`
  - repo names
  - branches
  - files/folders
  - identifiers where applicable

### Governance

- **Decision records (ADRs)** → `decision-records.md`
  - when to write an ADR
  - ADR numbering and format
  - how standards changes are recorded

---

## Standard levels

Each standard is labeled as one of:

- **Required** — mandatory in every adopting repository
- **Recommended** — default choice; deviations must be justified and documented in the repo
- **Optional** — adopt when useful

---

## Adoption pattern (recommended)

For each project repo:

- Add a small `CONTRIBUTING.md` that links back here and lists repo-specific additions.
- Copy templates/configs from `engineering-standards` into the repo where practical.
- Keep repo-specific standards additive; do not weaken Required baseline rules.

---

## Quick links (templates/configs)

- Templates: `../templates/`
- Tooling baselines: `../config/`
- Git commit template: `../git/`
- ADRs: `../adr/`
