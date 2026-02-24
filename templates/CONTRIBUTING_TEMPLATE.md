# Contributing Guide

This document defines repository-specific contribution rules and extensions.

This repository follows the baseline engineering standards defined in:

engineering-standards

These baseline standards are mandatory and may not be weakened or overridden.

This file exists only to define repository-specific additions or extensions.

---

# Baseline Standards (Inherited)

The following standards are inherited from engineering-standards:

- Repository structure standards
- Commit message standards
- Git workflow and branch discipline
- Formatting and linting requirements
- Documentation standards
- Naming conventions

All contributors must follow those baseline standards.

---

# Repository-Specific Standards

Document any additional rules that apply specifically to this repository.

Examples may include:

- Project-specific file structure requirements
- Domain-specific naming conventions
- Testing requirements unique to this repository
- Documentation requirements specific to this project
- UI, DOM, or architecture-specific standards

These rules may extend baseline standards but must not weaken required baseline rules.

Example extension:

This repository requires test-call validation blocks in learning lab files.

---

# Development Workflow

Standard workflow:

1. Create a branch

```
git checkout -b feat/scope-description
```

2. Make changes

3. Format and lint

```
npm run format
npm run lint
```

4. Commit using structured commit message

```
git commit
```

5. Push branch

```
git push origin feat/scope-description
```

6. Merge into main after validation

---

# Commit Message Requirements

This repository uses the structured commit format:

```
<type>(<scope>): <summary>
```

Example:

```
feat(dom): add interactive dropdown component
```

Commit template is defined in:

```
git/.gitmessage.txt
```

Enable locally:

```
git config commit.template .gitmessage.txt
```

---

# Formatting and Linting

All code must pass formatting and lint checks before commit.

Run:

```
npm run format
npm run lint
```

Fix auto-fixable issues:

```
npm run lint:fix
```

Commit only when lint reports zero errors.

---

# Documentation Requirements

Contributors must maintain documentation consistency.

Required:

- Update README if functionality changes
- Maintain clear and structured documentation
- Follow README template structure

---

# Definition of Done

A contribution is complete when:

- Code is complete and functional
- Formatting and linting pass
- Commit message follows required format
- Documentation is updated if needed
- Repository remains stable and consistent
