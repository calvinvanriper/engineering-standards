# SOP: Applying Engineering Standards to an Existing Repository

## Purpose

This document defines the safe, repeatable procedure for adopting the
engineering-standards baseline in an existing repository without introducing
functional regressions.

This process ensures:

- Controlled, reversible adoption of standards
- Preservation of repository stability during migration
- Clear commit history documenting each adoption phase
- Full compliance with engineering standards baseline

This SOP MUST be followed when standardizing any repository that already
contains code.

---

## Risk Model

Applying standards to an existing repository introduces risk because formatting
and linting changes modify existing files. While these changes should not alter
runtime behavior, improper sequencing can introduce regressions.

This SOP mitigates risk through:

- Safety branch isolation
- Incremental commits
- Verification checkpoints
- Explicit normalization phase
- Final regression verification

---

## Overview of Adoption Phases

The standards adoption process consists of five phases:

1. Safety Branch Creation
2. Standards Distribution Import
3. Tooling Baseline Adoption
4. Repository Normalization
5. Verification and Merge

---

## Phase 1: Safety Branch Creation

### Objective - Safety Branch Creation

Isolate standards adoption from the main branch to prevent unintended impact
to production code.

### Procedure - Safety Branch Creation

From the repository root:

```bash
git checkout -b chore/adopt-engineering-standards
```

### Verification - Safety Branch Creation

Confirm branch creation:

```bash
git branch --show-current
```

Expected output:

```bash
chore/adopt-engineering-standards
```

Confirm clean working tree:

```bash
git status
```

Expected output:

```bash
nothing to commit, working tree clean
```

### Rationale - Safety Branch Creation

All standards adoption must occur on a dedicated safety branch. This ensures:

- Immediate rollback capability
- Isolation from production code
- Clean review and merge process

## This branch MUST NOT be skipped

## Phase 2: Standards Distribution Import

### Objective - Standards Distribution Import

Import the engineering standards distribution layer into the repository without
activating enforcement yet.

This establishes baseline authority without modifying runtime behavior.

### Procedure - Standards Distribution Import

Create standards directories:

```bash
mkdir -p config/prettier config/eslint config/vscode git .github .vscode
```

Copy baseline assets from engineering-standards repository:

```bash
rsync -av --delete ../engineering-standards/config/prettier/ config/prettier/
rsync -av --delete ../engineering-standards/config/eslint/ config/eslint/
rsync -av --delete ../engineering-standards/config/vscode/ config/vscode/
rsync -av --delete ../engineering-standards/git/ git/
rsync -av --delete ../engineering-standards/.github/ .github/
```

Copy active VSCode enforcement files:

```bash
rsync -av --delete config/vscode/ .vscode/
```

### Verification - Standards Distribution Import

Confirm directory structure:

```bash
ls -R config/
ls -R git/
ls -R .github/
ls -R .vscode/
```

Expected directories:

- config/prettier/
- config/eslint/
- config/vscode/
- git/
- .github/
- .vscode/

### Commit Baseline Import

Stage imported files:

```bash
git add config git .github .vscode
```

Commit using standards commit template:

Commit type:

```text
chore(standards): import engineering standards baseline assets
```

### Rationale - Standards Distribution Import

This phase establishes local availability of standards without activating
enforcement.

## This separation ensures adoption occurs in controlled stages

## Phase 3: Tooling Baseline Adoption

### Objective - Tooling Baseline Adoption

Activate standards enforcement by aligning repository tooling with baseline
configurations.

This enables Prettier, ESLint, and editor enforcement.

---

### Step 3.1: Adopt Prettier Baseline

Copy baseline Prettier configuration:

```bash
cp config/prettier/.prettierrc.json .prettierrc.json
cp config/prettier/.prettierignore .prettierignore
```

Verify changes:

```bash
git diff -- .prettierrc.json .prettierignore
```

Stage and commit:

```bash
git add .prettierrc.json .prettierignore
git commit
```

Commit type:

```text
chore(prettier): adopt baseline prettier configuration
```

---

### Step 3.2: Adopt ESLint Baseline

If repository uses flat config (eslint.config.mjs):

Update rules to match baseline authority.

If repository uses .eslintrc format:

Replace with:

```bash
cp config/eslint/.eslintrc.base.cjs .eslintrc.cjs
```

Verify:

```bash
git diff -- eslint.config.mjs
```

Stage and commit:

```bash
git add eslint.config.mjs
git commit
```

Commit type:

```text
chore(eslint): align config with engineering standards baseline
```

---

### Step 3.3: Enable Commit Template

Enable standards commit template:

```bash
git config commit.template git/.gitmessage.txt
```

Verify:

```bash
git config --get commit.template
```

Expected output:

```text
git/.gitmessage.txt
```

---

### Rationale - Tooling Baseline Adoption

This phase activates enforcement but does not modify existing source files.

## Behavioral normalization occurs in the next phase

## Phase 4: Repository Normalization

### Objective - Repository Normalization

Normalize existing repository files to fully comply with baseline Prettier and
ESLint rules.

This phase may generate large diffs. It must be executed only after Phase 2 and
Phase 3 commits are complete.

---

### Step 4.1: Prettier Check (No Changes)

Run Prettier in check mode first:

```bash
npx prettier . --check
```

If issues are found, proceed to write mode.

---

### Step 4.2: Prettier Write (Apply Formatting)

Apply formatting:

```bash
npx prettier . --write
```

Verify scope of changes:

```bash
git status --porcelain=v1
git diff --stat
```

---

### Step 4.3: ESLint Check (No Autofix)

Run ESLint without fixing:

```bash
npx eslint . --max-warnings=0
```

If errors appear, proceed to fix mode.

---

### Step 4.4: ESLint Fix

Apply ESLint fixes:

```bash
npx eslint . --fix
```

Re-run verification:

```bash
npx eslint . --max-warnings=0
```

---

### Step 4.5: Commit Normalization

Stage all changes:

```bash
git add -A
```

Commit normalization:

```bash
git commit
```

Commit type:

```text
chore(format): normalize repository to engineering standards baseline
```

---

### Rationale - Repository Normalization

Normalization ensures:

- Existing code is fully compliant
- Future changes remain consistent
- CI and tooling behavior becomes predictable

## Large diffs are expected and acceptable in this phase

## Phase 5: Verification and Merge

### Objective - Verification and Merge

Confirm repository behavior is unchanged and safely merge standards adoption into
the main branch.

---

### Step 5.1: Working Tree Verification

Confirm clean working tree:

```bash
git status
```

Expected:

```text
nothing to commit, working tree clean
```

---

### Step 5.2: Runtime / Site Verification

Perform repository-specific verification.

Examples:

- Static site: open pages locally and verify layout and JavaScript behavior
- App/service: run unit tests, build, and smoke test critical flows
- Library: run test suite and verify published output

Minimum for static site:

```bash
# Example: start local preview (adjust to repo tooling)
npx serve .
```

Verify:

- Home page renders correctly
- Navigation and scripts behave correctly
- Styling is consistent (no broken layout)
- No console errors in browser dev tools

---

### Step 5.3: Push Branch and Open PR

Push safety branch:

```bash
git push -u origin chore/adopt-engineering-standards
```

Open PR into main branch.

PR must include:

- Summary of adoption phases
- Confirmation of verification steps completed
- Notes on any intentional deviations or overrides (e.g., prettier-ignore)

---

### Step 5.4: Merge Strategy

Preferred merge strategy:

- Squash merge is NOT recommended (preserves adoption history)
- Use merge commit or rebase merge depending on team convention

---

### Optional: Add README Standards Declaration

If repository README does not declare standards authority, add:

```md
<!-- prettier-ignore -->
**Engineering Standards:** v1.0.0 · **Baseline Authority:** engineering-standards
```

Commit type:

```text
docs(readme): declare engineering standards baseline authority
```

---

### Rationale - Verification and Merge

Final verification prevents regressions and ensures standards adoption becomes
a safe, repeatable process.

---

## Appendix: Common Issues

### Prettier wraps single-line declarations in Markdown

If a standards declaration or badge line exceeds printWidth and must remain on
one line, use:

```md
<!-- prettier-ignore -->
**Engineering Standards:** v1.0.0 · **Baseline Authority:** engineering-standards
```

---

### CRLF/LF warnings on Windows

Git may warn that LF will be replaced by CRLF. The baseline uses LF.

Recommended approaches:

- Ensure `.gitattributes` enforces LF where required
- Review `git config core.autocrlf` and team policy
- Prefer editor settings that respect `files.eol: "\n"`

---

### Large diffs during normalization

Large diffs are expected during Phase 4. Risk is mitigated through:

- Running Prettier before ESLint
- Running ESLint check before ESLint fix
- Committing normalization separately from tooling adoption
- Performing runtime verification before merge
