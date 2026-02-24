# Prettier Baseline (engineering-standards)

This folder contains the baseline Prettier configuration for repositories
adopting `engineering-standards`.

Repositories may extend these standards, but may not weaken or override anything
marked Required in the baseline standards.

---

## ✅ Required

Repositories adopting these standards must:

- Use Prettier for formatting (where applicable)
- Format code consistently before merge
- Keep formatting automated (recommended via editor + CI)

This baseline provides:

- `.prettierrc.json` — core formatting rules
- `.prettierignore` — ignores for dependencies, builds, and caches

---

## Included Files

### `.prettierrc.json`

Baseline formatting rules:

- 2-space indentation
- semicolons enabled
- single quotes
- trailing commas where valid
- print width set to 80 for readability
- LF line endings for cross-platform consistency

### `.prettierignore`

Ignores common folders and artifacts:

- `node_modules/`
- build outputs (`dist/`, `build/`, etc.)
- caches (`.cache/`, `.turbo/`, etc.)
- coverage output

---

## Recommended Adoption Pattern

Copy these files into the target repository:

```
config/prettier/.prettierrc.json
config/prettier/.prettierignore
```

Then ensure the repo has Prettier installed (if using Node tooling):

```
npm install --save-dev prettier
```

Add scripts (example):

```
{
"scripts": {
"format": "prettier . --write",
"format:check": "prettier . --check"
}
}
```

---

## Notes

- Prettier may reformat spacing and line wrapping; this is expected.
- Manual alignment of comments or custom spacing is intentionally not preserved.
- If a repo must deviate from a baseline rule, document the exception in that
  repo’s CONTRIBUTING.md (only allowed for Recommended/Optional standards, not
  Required baseline rules).
