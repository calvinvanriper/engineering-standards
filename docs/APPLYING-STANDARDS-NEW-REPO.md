# SOP: Applying Engineering Standards to a New Repository

## Purpose

This document defines the standard procedure for initializing a new repository
using the engineering-standards baseline.

This process ensures:

- Immediate compliance with engineering standards
- Consistent tooling and formatting from project inception
- Elimination of future normalization requirements
- Full integration with standards authority and enforcement systems

This SOP MUST be followed when creating any new repository intended to comply
with engineering-standards.

---

## Risk Model

Applying standards to a new repository carries minimal risk because no legacy
code exists that could be affected by formatting or lint normalization.

Standards adoption can therefore occur immediately during repository setup.

This SOP ensures correct initialization order and complete standards
integration.

---

## Overview of Initialization Phases

The standards initialization process consists of four phases:

1. Repository Creation
2. Standards Distribution Import
3. Tooling Baseline Activation
4. Initial Verification

---

## Phase 1: Repository Creation

### Objective — Repository Creation

Create the new repository and establish initial project structure.

### Procedure — Repository Creation

Create repository locally or via GitHub.

Initialize repository:

```bash
git init
```

Create initial README:

```bash
touch README.md
```

Create initial commit:

```bash
git add README.md
git commit -m "chore(init): initialize repository"
```

If using GitHub, connect remote:

```bash
git remote add origin <repository-url>
git push -u origin main
```

### Verification — Repository Creation

Confirm repository is initialized:

```bash
git status
```

Expected output:

```text
nothing to commit, working tree clean
```

### Rationale — Repository Creation

## Establishes a clean repository foundation before standards integration

## Phase 2: Standards Distribution Import

### Objective — Standards Distribution Import

Import the engineering-standards distribution layer into the repository.

This establishes local standards authority mirror and enforcement layer.

### Procedure — Standards Distribution Import

Create standards directories:

```bash
mkdir -p config/prettier config/eslint config/vscode git .github .vscode
```

Copy baseline assets from engineering-standards repository:

```bash
cp -r ../engineering-standards/config/prettier/* config/prettier/
cp -r ../engineering-standards/config/eslint/* config/eslint/
cp -r ../engineering-standards/config/vscode/* config/vscode/
cp -r ../engineering-standards/git/* git/
cp -r ../engineering-standards/.github/* .github/
```

Copy active VSCode enforcement files:

```bash
cp -r config/vscode/* .vscode/
```

### Verification — Standards Distribution Import

Confirm directory structure:

```bash
ls config/
ls git/
ls .github/
ls .vscode/
```

Expected directories:

- config/prettier/
- config/eslint/
- config/vscode/
- git/
- .github/
- .vscode/

### Commit Standards Import

Stage imported files:

```bash
git add config git .github .vscode
```

Commit using standards commit template:

```text
chore(standards): import engineering standards baseline assets
```

### Rationale — Standards Distribution Import

Establishes standards authority mirror and enforcement infrastructure before
tooling activation.

---

## Phase 3: Tooling Baseline Activation

### Objective — Tooling Baseline Activation

Activate baseline tooling so the repository enforces standards from the start.

### Procedure — Tooling Baseline Activation

Adopt Prettier baseline configuration:

```bash
cp config/prettier/.prettierrc.json .prettierrc.json
cp config/prettier/.prettierignore .prettierignore
git add .prettierrc.json .prettierignore
git commit -m "chore(prettier): adopt baseline prettier configuration"
```

Adopt ESLint baseline configuration:

- If using flat config: align `eslint.config.mjs` to match baseline.
- If using `.eslintrc` format: start from baseline file and extend as needed.

Enable commit template:

```bash
git config commit.template git/.gitmessage.txt
git config --get commit.template
```

Expected output:

```text
git/.gitmessage.txt
```

### Rationale — Tooling Baseline Activation

Activating tooling early prevents standards drift and avoids future repository
normalization work.

---

## Phase 4: Initial Verification

### Objective — Initial Verification

Confirm standards tooling is operational and the repository is compliant before
development begins.

### Procedure — Initial Verification

Run Prettier check:

```bash
npx prettier . --check
```

Run ESLint check:

```bash
npx eslint . --max-warnings=0
```

### Verification — Initial Verification

Confirm clean working tree:

```bash
git status
```

Expected output:

```text
nothing to commit, working tree clean
```

### Optional: Add README Standards Declaration

Add this line near the top of `README.md`:

```md
<!-- prettier-ignore -->
**Engineering Standards:** v1.0.0 · **Baseline Authority:** engineering-standards
```

Commit type:

```text
docs(readme): declare engineering standards baseline authority
```

### Rationale — Initial Verification

Verifies that standards are enforced from day one, preventing future cleanup
work and ensuring consistent contributor experience.

---

## Appendix: Common Issues

### Windows CRLF/LF warnings

Git may warn that LF will be replaced by CRLF. The baseline uses LF.

Recommended approaches:

- Ensure `.gitattributes` enforces LF where required
- Review `git config core.autocrlf` and team policy
- Prefer editor settings that respect `files.eol: "\n"`
