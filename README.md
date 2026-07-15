# LEONARDO-Ftir

Equip the **Spero FTIR microscope** (Leonardo DRS, former Daylight Solutions) with AI functionality: image analytics and spectra analytics. Requirements overlap substantially with the Asbest-Scan app.

Sub-project under the ProMetronics portfolio. Owned by [team].

## What lives here

- `data/` — shared reference data (committed) and local-only raw/processed data (gitignored).
- `docs/` — project planning. Numbered subfolders (`00_Project_Input`, `01_Requirements`, `02_Architecture`, `03_Project_Plan`, `04_Decisions`, `05_Research`, `06_Mockups`) with `PROJECT_PLAN.md` as the hub.
- `decisions/` — Architecture Decision Records (ADRs) for project-level decisions.
- `roadmap/` — project-scoped roadmap config + extracted YAML. Rendered via `PROM-Portfolio/roadmap-tools/`.
- `roadmap-tools/` — placeholder for project-specific render overrides; main pipeline is in `PROM-Portfolio/roadmap-tools/`.
- `scrum-of-scrums/` — project standup notes. Cross-project sync lives in `PROM-Portfolio/scrum-of-scrums/`.
- `cost-monitoring/` — project-scoped cost view. Main pipeline is in `PROM-Portfolio/cost-monitoring/`.
- `documentation/` — research notes, workflow analyses, contracts, assets.

## Note on language

The structural language across this repo is English (folder names, file names, lead documents). Some content files may be in German and get translated in a follow-up pass; German-only versions are preserved as `*-de.md` companions on request.
