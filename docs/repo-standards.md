# Repository Standards

This document defines the **baseline structural and engineering standards** required for all repositories adopting `engineering-standards`.

Repositories may extend these standards, but may not weaken or override anything marked **Required**.

---

# 1. Repository Structure (✅ Required)

Every repository must maintain a clear, intentional structure.

At minimum, repositories must include:

```
README.md
CONTRIBUTING.md (may reference engineering-standards)
.gitignore
```

If the repository contains executable code, it must also include:

```
src/        (or equivalent primary code directory)
```

Optional but strongly recommended:

```
docs/
config/
scripts/
tests/
```

Structure must remain stable and intentional. Avoid unnecessary restructuring once established.

---

# 2. Required Repository Files (✅ Required)

Every repository must include:

## README.md

Must clearly define:

- purpose of the repository
- what the project does
- how to run or use the project (if applicable)
- structure overview (if non-trivial)

README must follow the baseline README template structure.

---

## CONTRIBUTING.md

Must either:

Option A — fully define repo-specific standards

or

Option B (Recommended) — reference engineering-standards as baseline:

Example:

```
This repository follows the baseline engineering standards defined in:

https://github.com/<username>/engineering-standards

Any repository-specific additions or extensions are documented below.
```

Repository-specific standards may:

- add stricter rules
- add additional conventions

Repository-specific standards may NOT:

- remove Required baseline standards
- weaken Required baseline standards

---

## .gitignore

Must exclude:

- dependency folders (node_modules, etc.)
- build artifacts
- temporary files
- OS-generated files

---

# 3. Code File Standards (✅ Required)

All code files must maintain clarity, consistency, and maintainability.

Required:

- Code must be formatted using the configured formatter (Prettier baseline)
- Code must pass linting with zero errors
- Semicolon usage must be consistent within the repository
- Comments explain intent ("why"), not mechanics ("how")

Recommended:

- Primary functions should include documentation comments (JSDoc or equivalent)
- Logical structure should be clear and intentional

---

# 4. Formatting and Linting (✅ Required)

Repositories must use automated formatting and linting tools where applicable.

Baseline tools:

- Prettier — formatting
- ESLint — linting

Repositories must ensure:

```
0 lint errors
```

before merging changes.

Formatting and linting enforcement may be manual or automated (CI).

---

# 5. Naming Conventions (✅ Required)

Consistency is required across:

- file names
- folder names
- identifiers where applicable

Baseline convention:

```
lowercase-kebab-case
```

Examples:

```
user-service.js
data-parser.ts
auth-controller.js
```

Exceptions may apply for language-specific standards.

---

# 6. Commit Message Standards (✅ Required)

All repositories must use structured commit messages.

Baseline format:

```
<type>(<scope>): <summary>
```

Example:

```
feat(auth): implement JWT authentication flow
```

Allowed types:

- feat
- fix
- refactor
- docs
- style
- chore
- test

Commit messages must:

- use present tense
- clearly describe the change
- avoid trailing periods in summary line

Commit template usage is strongly recommended:

```
git config commit.template .gitmessage.txt
```

---

# 7. Tooling Configuration (🟡 Recommended)

Repositories should use shared tooling baselines from:

```
engineering-standards/config/
```

Including:

- Prettier configuration
- ESLint configuration
- VS Code workspace settings

This ensures consistency across environments.

---

# 8. Documentation Standards (🟡 Recommended)

Documentation must be:

- concise
- structured
- consistent
- explanatory

Avoid:

- redundant documentation
- outdated instructions
- undocumented behavior

Documentation standards are defined in:

```
documentation-standards.md
```

---

# 9. Repository Extensions (🟡 Recommended)

Repositories may define additional standards beyond the baseline.

These must be documented in the repository's:

```
CONTRIBUTING.md
```

Extensions must not weaken baseline Required standards.

---

# Definition of Done (Baseline)

A repository is considered compliant when:

- Required structure exists
- Required files exist
- Formatting and linting pass
- Commit standards are followed
- Documentation meets baseline clarity requirements
