# Git Workflow and Commit Discipline

This document defines the baseline Git workflow for all repositories adopting engineering-standards.

Repositories may extend these standards, but may not weaken or override anything marked Required.

---

# 1. Branching Model (✅ Required)

Baseline branching model:

- main is the default branch
- main must always represent a stable, production-safe state
- work must be performed on short-lived branches and merged into main

Direct commits to main should be avoided except for trivial documentation or administrative changes.

Branch naming convention (Required):

```
<type>/<scope>-<short-description>
```

Examples:

```
feat/auth-add-jwt-support
fix/api-handle-null-response
docs/standards-add-documentation-rules
refactor/ui-extract-state-logic
chore/tooling-update-eslint-config
```

Allowed types:

- feat
- fix
- refactor
- docs
- style
- chore
- test

---

# 2. Commit Message Standards (✅ Required)

All commits must follow the structured commit message format:

```
<type>(<scope>): <summary>
```

Rules:

- Use present tense ("add", not "added")
- Keep summary concise and descriptive
- Do not end summary with a period
- Scope must be meaningful and consistent within the repository

Examples:

```
feat(auth): add JWT login flow
fix(api): handle missing user id in request
docs(standards): define repository structure baseline
refactor(ui): extract reusable modal component
```

Commit messages are part of the repository’s permanent engineering record and must remain clear and searchable.

---

# 3. Commit Discipline (🟡 Recommended)

Commits should represent a single logical change.

Recommended practices:

- One logical change per commit
- Avoid mixing formatting changes with functional changes
- Avoid unrelated modifications in the same commit
- Commit frequently, but intentionally

If performing formatting-only changes, isolate them:

```
style(format): apply prettier formatting
```

---

# 4. Branch Workflow (🟡 Recommended)

Standard workflow:

Step 1 — Create a branch

```
git checkout -b feat/scope-description
```

Step 2 — Make changes and commit using the commit template

Step 3 — Push branch

```
git push origin feat/scope-description
```

Step 4 — Merge into main

Preferred methods:

- Squash merge (Recommended)
- Rebase merge (Allowed)

Avoid unnecessary merge commits unless preserving history is important.

---

# 5. Pull Request Standards (🟡 Recommended)

When using Pull Requests, PRs should follow the same structured format.

PR title format:

```
<type>(<scope>): <summary>
```

PR description should include:

- What changed
- Why it changed
- How it was validated

Example:

```
Implements baseline git workflow documentation.

Defines commit format, branch discipline, and merge standards
to ensure consistency across repositories.
```

---

# 6. Merge Standards (✅ Required)

Before merging into main, the following must be true:

- Code is properly formatted
- Linting passes with zero errors
- Documentation is updated if applicable
- Repository remains in a stable state

Do not merge broken or incomplete work into main.

main must remain deployable and functional at all times.

---

# 7. Commit Template Usage (🟡 Recommended)

Repositories should use the provided commit message template.

Template location:

```
git/.gitmessage.txt
```

Enable locally:

```
git config commit.template .gitmessage.txt
```

Optional global configuration:

```
git config --global commit.template /absolute/path/to/.gitmessage.txt
```

This ensures commit consistency across repositories.

---

# 8. Branch Protection (🟡 Recommended)

Recommended GitHub settings for main:

- Require pull request before merge
- Require status checks to pass
- Prevent force pushes
- Prevent deletion of main

These protections prevent accidental repository instability.

---

# Definition of Done (Git Workflow Compliance)

A repository is compliant when:

- Commit message format is consistently followed
- Branch naming follows the standard convention
- main remains stable at all times
- Changes are properly committed, reviewed, and merged
- Repository history remains clean, readable, and structured
