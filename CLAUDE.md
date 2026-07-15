# CLAUDE.md — LEONARDO-Ftir

Project-specific instructions for Claude in this repo.

## Project context

**LEONARDO-Ftir** is a sub-project under the ProMetronics portfolio. Goal: equip the **Spero FTIR microscope** from **Leonardo DRS** (former Daylight Solutions) with AI functionality. The two analytics streams — **image analytics** (IR/hyperspectral imaging) and **spectra analytics** (FTIR spectra) — have requirements very similar to the **Asbest-Scan** app, which is the primary structural reference (`../Asbest-Scan`).

## Current scope

- Project standing up from scratch. `docs/PROJECT_PLAN.md` is a bootstrap-format stub to be filled per `PROM-Portfolio/docs/BOOTSTRAP_NEW_PROJECT_PLAN.md`.
- `docs/01_Requirements/` and `docs/02_Architecture/` hold empty stubs — fill jointly with andre; do not push into detailed architecture unprompted.
- `roadmap/` holds a seeded `config.yaml` plus empty `_extracted_*.yaml` placeholders; the project renders as a placeholder lane until the plan doc is populated.

## Connection to the portfolio

Register `leonardo-ftir` in `PROM-Portfolio/roadmap/_portfolio.yaml` under `projects`. After any plan/YAML change: `cd PROM-Portfolio/roadmap-tools && python3 run_all.py` regenerates `PROM-Portfolio/roadmap/leonardo-ftir_gantt.html` and the portfolio chart. Schema reference: XANA-AI.

## Conventions

- Language toward the user: match whatever the user is using (typically German or English).
- Outputs / reports: Markdown, terse, no rambling postambles.
- Portfolio conventions (scaffold, data convention, versioning, workflow discipline §13) apply — see `PROM-Portfolio/PROM-Portfolio.md`. One master thread per repo, only `main` as a branch, push sweep at session end.
- **Missing resources:** if files, assets, folder access, tools, or credentials are missing, ask immediately before starting workarounds. Example: missing logo → ask for the file, don't rebuild it.
- **Official ProMetronics logo:** lives under `/Users/andre1/Documents/GitHub/PROM-admin/Logo/PNG` (source of truth; request access to `PROM-admin` if needed).

## Important files

- `docs/PROJECT_PLAN.md` — central planning hub; links to all detail areas
- `docs/01_Requirements/` … `docs/06_Mockups/` — detail areas of the plan
- `roadmap/config.yaml` — per-project Gantt config
- `MODEL_PROMPTS.md` — portfolio-wide prompt convention (intentionally identical across all repos — do not allow drift)
