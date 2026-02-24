# ESLint Baseline (engineering-standards)

This folder contains the baseline ESLint configuration for repositories adopting `engineering-standards`.

Repositories may extend these standards, but may not weaken or override anything marked Required in the baseline standards.

---

## ✅ Required

Repositories adopting these standards must:

- Run linting before merge (manual or CI)
- Maintain 0 lint errors in main
- Keep linting rules consistent and documented

This baseline provides:

- `.eslintrc.base.cjs` — general-purpose ESLint baseline

---

## Included Files

### `.eslintrc.base.cjs`

Baseline design goals:

- dependency-light (extends `eslint:recommended`)
- works for both Node and browser JavaScript
- enforces consistency and safety
- encourages maintainable patterns

Key baseline rules include:

- semicolons enforced
- single quotes enforced (with safe exceptions)
- `eqeqeq` required
- `curly` required for all blocks
- `no-var` and `prefer-const`
- unused vars disallowed (underscore `_` prefix allowed)

Console usage:

- `console.warn` and `console.error` are allowed
- other console usage produces warnings by default

Repositories may tighten this rule if desired.

---

## Recommended Adoption Pattern

Copy the baseline config file into the target repository:

```
config/eslint/.eslintrc.base.cjs
```

Then create a repo-root ESLint config that extends it.

Example (repo root): `.eslintrc.cjs`

```
module.exports = {
extends: ['./config/eslint/.eslintrc.base.cjs'],
};
```

Install ESLint (Node projects):

```
npm install --save-dev eslint
```

Add scripts (example):

```
{
"scripts": {
"lint": "eslint .",
"lint:fix": "eslint . --fix"
}
}
```

---

## Notes

- ESLint catches correctness and safety issues; it is not a replacement for tests.
- If a repo needs additional rules (React, TypeScript, Jest, etc.), add them in the repo’s ESLint config while preserving the baseline requirements.
- If a repo must deviate from a baseline rule, document the exception in that repo’s CONTRIBUTING.md (only allowed for Recommended/Optional standards, not Required baseline rules).
