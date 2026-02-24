# Documentation Standards

This document defines the baseline documentation standards for all repositories adopting engineering-standards.

Repositories may extend these standards, but may not weaken or override anything marked Required.

---

# 1. Copy-Paste Integrity (✅ Required)

Any documentation intended to be copied directly into a file must be provided as a single uninterrupted code block.

Required rules:

- Must use one continuous fenced code block
- Must not be split across multiple blocks
- Must not contain inline annotations that break formatting
- Must not require manual reformatting after paste
- Must preserve exact indentation and spacing

Correct example:

```
# Example Header

This content can be copied directly without modification.
```

Incorrect example (Do NOT do this):

Text outside block

```
partial content
```

More text outside block

```
remaining content
```

---

# 2. Clarity and Structure (✅ Required)

Documentation must be:

- concise
- structured
- logically organized
- written for maintainability

Avoid:

- unnecessary verbosity
- redundant explanations
- ambiguous instructions

---

# 3. Standards Language (✅ Required)

Standards must use explicit requirement levels:

- ✅ Required — mandatory baseline rule
- 🟡 Recommended — strongly preferred default
- ⚪ Optional — useful but not mandatory

This ensures clear enforcement boundaries.

---

# 4. File Organization (🟡 Recommended)

Documentation should be organized under:

```
docs/
```

Each document should have a single clear responsibility.

Examples:

```
repo-standards.md
git-workflow.md
documentation-standards.md
naming-conventions.md
```

---

# 5. Templates vs Standards (✅ Required)

Clear separation must exist between:

Standards (rules):

```
docs/
```

Templates (copyable assets):

```
templates/
```

Tool configurations:

```
config/
```

Git standards:

```
git/
```

This ensures predictable structure across repositories.

---

# 6. Maintainability (🟡 Recommended)

Documentation should be updated when:

- standards change
- workflows change
- tooling changes
- architectural decisions evolve

Major standards changes should be recorded as ADRs.
