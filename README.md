# engineering-standards

Centralized engineering standards, commit templates, and documentation profiles used across all Calvin VanRiper development repositories.

# engineering-standards

Central source of truth for engineering standards, conventions, and reusable templates across all repositories in this workspace.

This repository contains **standards, templates, and configuration baselines** only. It does **not** contain application code.

---

## Goals

- Establish production-grade engineering discipline
- Ensure consistency across current and future projects
- Reduce duplication of standards files across repos
- Enable rapid creation of new repositories using predefined templates
- Create a scalable foundation for long-term professional development

---

## Policy model (baseline + extensions)

This repo defines the **baseline** engineering standards.

**Rule:** Individual repositories may **add to** these standards, but may not **remove, weaken, or override** anything marked as **Required** in this repository.

- **Required** = must be followed in every repository adopting these standards
- **Recommended** = strongly suggested defaults; repos may deviate with justification
- **Optional** = useful patterns that may be adopted as needed

If a repo needs to deviate from a **Recommended** guideline, it should document the exception in that repo’s `CONTRIBUTING.md` (or `docs/standards.md`) with:

- what is different
- why it differs
- whether it’s temporary
- when it will be revisited

---

## How other repos adopt these standards

Recommended adoption approach:

1. Keep a small, repo-specific `CONTRIBUTING.md` that:
   - links to this repo as the canonical baseline
   - lists any **additions** and **approved exceptions** (only to Recommended/Optional items)

2. Copy templates/configs from this repo into the target repo when creating it:
   - `templates/*`
   - `config/*`
   - `git/.gitmessage.txt` (optional but encouraged)

This keeps consumption simple and avoids submodules/subtrees until you actually need strict central enforcement.

---

## What’s inside

- `docs/` — canonical standards documentation (the “why” and “what”)
- `templates/` — reusable templates (README, CONTRIBUTING, PR, issues)
- `config/` — baseline tool configs (ESLint, Prettier, VS Code)
- `git/` — commit message template and Git discipline assets
- `adr/` — Architecture Decision Records for changes to standards

Start here: **docs/index.md**

---

## Change management

Standards evolve. When a baseline standard changes:

- document the rationale with an ADR in `adr/`
- update the relevant doc in `docs/`
- keep the baseline coherent and internally consistent

---

## License

See `LICENSE`.
