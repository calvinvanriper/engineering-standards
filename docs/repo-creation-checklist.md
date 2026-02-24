# Repository Creation Checklist

Use this checklist when creating a new repository that will adopt `engineering-standards`.

Goal: create a consistent, production-grade repo baseline in minutes.

---

## 1) Repository Setup (✅ Required)

- [ ] Repository name is lowercase kebab-case (e.g., `home-food-inventory`)
- [ ] Default branch is `main`
- [ ] `README.md` exists
- [ ] `CONTRIBUTING.md` exists
- [ ] `.gitignore` exists

---

## 2) Copy Standards Assets (🟡 Recommended)

Copy the following from `engineering-standards` into the new repo:

- [ ] `config/prettier/` → Prettier baseline
- [ ] `config/eslint/` → ESLint baseline
- [ ] `config/vscode/` → VS Code baseline
- [ ] `git/.gitmessage.txt` → commit message template
- [ ] `templates/PULL_REQUEST_TEMPLATE.md` (optional but recommended)
- [ ] `templates/ISSUE_TEMPLATE/` (optional but recommended)

---

## 3) Configure Tooling (Node repositories) (🟡 Recommended)

Install tooling:

- [ ] `prettier` installed
- [ ] `eslint` installed

Example:

```
npm install --save-dev prettier eslint
```

Add scripts to `package.json`:

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

## 4) Enable Commit Template (🟡 Recommended)

Enable the commit message template in the repo:

```
git config commit.template git/.gitmessage.txt
```

---

## 5) README and CONTRIBUTING (✅ Required)

- [ ] `README.md` follows the baseline README template structure
- [ ] `CONTRIBUTING.md` references `engineering-standards` as the baseline authority
- [ ] Repo-specific rules are documented as **extensions**, not overrides

---

## 6) Branch and Commit Discipline (✅ Required)

- [ ] Branches follow the naming convention:

```
<type>/<scope>-<short-description>
```

- [ ] Commits follow the required format:

```
<type>(<scope>): <summary>
```

---

## 7) Verification (✅ Required)

Before the repo is considered “baseline compliant”:

- [ ] Formatting applied (Prettier)
- [ ] Lint passes with 0 errors (ESLint)
- [ ] README and CONTRIBUTING are complete
- [ ] Initial commit history is structured and readable

---

## Definition of Done

A repository is compliant when:

- Required structure exists
- Required documentation exists
- Formatting and linting are working
- Commit discipline is established
- Repo-specific standards are additive extensions only
