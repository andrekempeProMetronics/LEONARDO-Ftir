# Data folder

Convention used across all sub-projects.

- `data/reference/` → committed in git. Lookup tables, schemas, fixtures, small reference datasets. Anything you want versioned and shareable.
- `data/raw/` → local only, gitignored. Raw datasets, large files, sensitive data. Create the folder locally; nothing here gets pushed.
- `data/processed/` → local only, gitignored. Derived or intermediate data, caches.
- `data/tmp/` → local only, gitignored. Throwaway scratch.

To promote a file from `raw/` to versioned: move it to `reference/`, then commit.
