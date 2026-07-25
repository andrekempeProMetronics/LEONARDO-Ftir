# Confidential files — never commit / never push

LEONARDO-Ftir is part of the **automated portfolio sweep** (the agent commits & pushes it like the other repos). Any path/pattern listed below is **confidential** and must **never** be committed or pushed. Enforcement is via `.gitignore`, which mirrors this list.

**When you add a confidential file:** add its path/pattern **here** *and* to `.gitignore`. Both must stay in sync. This list is meant to grow.

## Excluded (confidential)

| Path / pattern | What | Reason |
|---|---|---|
| _(none yet)_ | — | — |

**Hard rule — secrets:** never commit passwords, API keys, tokens, `.env` contents, `.github-token`, or certificate private keys. Secrets live in the password manager (1Password), never in git. If one appears in the tree, exclude it and rotate if it may have leaked.

## Sweep safety rule

Before an automated commit/push (portfolio sweep), the agent:

1. **New/untracked files:** reviews them for confidential content — if anything could be sensitive, it **stops, lists the files, and asks** before committing; anything confidential is added to `.gitignore` + the list above **first**. If in doubt, exclude.
2. **Large files / bulk binaries (>~50 MB):** **stops, lists the files, and asks** whether to push or ignore; on "ignore" it adds them to `.gitignore` before continuing the sweep.
