# VS Code Baseline (engineering-standards)

This folder contains baseline VS Code settings and extension recommendations for repositories adopting `engineering-standards`.

Repositories may extend these settings, but should avoid diverging without a clear reason.

---

## ✅ Required (Behavioral)

Repositories adopting these standards must ensure:

- formatting is applied consistently (Prettier baseline)
- lint fixes are applied consistently (ESLint baseline)
- line endings and whitespace are normalized

This baseline supports those requirements via VS Code configuration.

---

## Included Files

### `settings.json`

Baseline goals:

- format on save enabled
- Prettier is the default formatter
- Prettier requires a config file (`prettier.requireConfig: true`)
- ESLint is validated for common JS/TS file types
- ESLint fixes are applied on save
- 80-character ruler for consistent readability
- LF line endings and normalized whitespace

### `extensions.json`

Recommended extensions include:

- ESLint
- Prettier
- EditorConfig
- Code Spell Checker
- Markdownlint

---

## Recommended Adoption Pattern

Copy these files into the target repository:

```
config/vscode/settings.json
config/vscode/extensions.json
```

Developers using VS Code should:

- install the recommended extensions
- trust workspace settings for formatting/linting consistency

---

## Notes

- Workspace settings standardize behavior across machines.
- If a repo needs different formatting behavior, update the Prettier config first rather than changing editor settings.
- Avoid personal preference settings here (themes, fonts, etc.). Keep this strictly workflow and consistency related.
