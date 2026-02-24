# Adoption Guide

This guide explains how to apply engineering-standards to a repository.

The goal is fast, consistent adoption with minimal friction.

---

# Step 1 — Copy baseline configs

Copy the following folders into the target repository:

```
config/prettier/
config/eslint/
config/vscode/
git/.gitmessage.txt
```

These provide formatting, linting, editor, and commit standards.

---

# Step 2 — Copy templates

Copy:

```
templates/README_TEMPLATE.md → README.md
templates/CONTRIBUTING_TEMPLATE.md → CONTRIBUTING.md
```

Then customize the content for the specific project.

---

# Step 3 — Install tooling (Node-based repositories)

Install required dev dependencies:

```
npm install --save-dev prettier eslint
```

Add scripts to package.json:

```
{
  "scripts": {
    "format": "prettier . --write",
    "format:check": "prettier . --check",
    "lint": "eslint .",
    "lint:fix": "eslint . --fix"
  }
}
```

---

# Step 4 — Enable commit template

From the repository root:

```
git config commit.template git/.gitmessage.txt
```

This ensures commit messages follow the baseline format.

---

# Step 5 — Verify formatting and linting

Run:

```
npm run format
npm run lint
```

Ensure lint reports:

```
0 errors
```

---

# Step 6 — Link to engineering standards

Ensure CONTRIBUTING.md references engineering-standards as baseline authority.

Example:

```
This repository follows the engineering standards defined in:

https://github.com/<username>/engineering-standards
```

---

# Result

The repository now fully complies with engineering standards.

All future development will follow consistent structure, formatting, and commit discipline.
