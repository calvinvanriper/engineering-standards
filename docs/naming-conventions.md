# Naming Conventions

This document defines baseline naming conventions for repositories adopting `engineering-standards`.

Repositories may extend these standards, but may not weaken or override anything marked Required.

---

## 1. Repositories (✅ Required)

Repository names must be:

- lowercase
- kebab-case
- descriptive and stable

Examples:

- `engineering-standards`
- `javascript-learning-labs`
- `home-food-inventory`

Avoid:

- spaces
- mixed case
- unclear acronyms without context

---

## 2. Folders and Files (✅ Required)

Folder and file names must be:

- lowercase
- kebab-case

Examples:

- `string-manipulation/`
- `repo-standards.md`
- `user-service.js`

Exceptions:

- Language/framework conventions that are industry-standard and expected
  (e.g., `README.md`, `LICENSE`, `package.json`)

---

## 3. Branches (✅ Required)

Branch naming format:

```
<type>/<scope>-<short-description>
```

Examples:

- `feat/auth-add-jwt-support`
- `docs/standards-add-adoption-guide`
- `fix/api-handle-null-response`

Types must match the allowed types in `docs/git-workflow.md`.

---

## 4. Commit Scope (🟡 Recommended)

Commit scope should be:

- a stable subsystem name
- a folder name
- a feature/module name

Examples:

- `docs(standards): ...`
- `feat(auth): ...`
- `fix(api): ...`

Avoid scopes that are overly broad:

- `misc`
- `stuff`
- `updates`

---

## 5. Identifiers (🟡 Recommended)

Within code:

- Prefer clear, descriptive names
- Avoid over-abbreviation
- Use language-appropriate casing conventions

Examples:

- JavaScript: `camelCase` for variables/functions, `PascalCase` for classes
- Constants: `UPPER_SNAKE_CASE` when truly constant

---

## Definition of Done (Naming)

Naming conventions are compliant when:

- repo names are stable and kebab-case
- files/folders follow kebab-case (except standard convention files)
- branches follow the baseline branch naming format
- commit scopes are meaningful and consistent
