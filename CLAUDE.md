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
- **Document header:** standalone documents/reports get a ProMetronics logo + author + timestamp in the header — see `PROM-Portfolio/AGENT_OPERATIONS.md` §7. Logo lives at `docs/05_Research/assets/ProMetronics-Logo.png` (copied from `PROM-admin/Logo/PNG`).
- Portfolio conventions (scaffold, data convention, versioning, workflow discipline §13) apply — see `PROM-Portfolio/PROM-Portfolio.md`. One master thread per repo, only `main` as a branch, push sweep at session end.
- **Missing resources:** if files, assets, folder access, tools, or credentials are missing, ask immediately before starting workarounds. Example: missing logo → ask for the file, don't rebuild it.
- **Official ProMetronics logo:** lives under `/Users/andre1/Documents/GitHub/PROM-admin/Logo/PNG` (source of truth; request access to `PROM-admin` if needed).

## Important files

- `docs/PROJECT_PLAN.md` — central planning hub; links to all detail areas
- `docs/01_Requirements/` … `docs/06_Mockups/` — detail areas of the plan
- `roadmap/config.yaml` — per-project Gantt config
- `MODEL_PROMPTS.md` — portfolio-wide prompt convention (intentionally identical across all repos — do not allow drift)

## 🔴 Sessionstart: `allow_cowork_file_delete` für dieses Repo aufrufen

Vor dem ersten git-Schreibvorgang einer Cowork-Session (portfolio-weite Regel, verankert 2026-08-18):

```
allow_cowork_file_delete(file_path="<REPO-ROOT>/.git/index.lock")
```

Hintergrund: Die Cowork-Sandbox darf in gemounteten Ordnern Dateien anlegen, aber nicht löschen. Ohne diese Freigabe hinterlässt **jeder** git-Schreibvorgang Sperrdateien (`index.lock`, `HEAD.lock`, `refs/*.lock`, `tmp_obj_*`), an denen jede Folgeoperation scheitert — auch die automatischer Läufe. Der Aufruf gibt das Löschen für den **gesamten Repo-Ordner** frei (ein Aufruf je Repo und Session); danach räumt git seine Sperren selbst auf. Bei „Operation not permitted" mitten in der Session: Tool aufrufen und wiederholen — keine rm-Kommandos an andre. Altlasten einmalig räumen: `find .git -name "*.lock" -delete; find .git -name "tmp_obj_*" -delete; git gc`. Details/Fallback: `PROM-Portfolio/AGENT_OPERATIONS.md` §1 („Root fix 2026-08-18").

**🔴 Pflicht bei jeder Anfrage: sagen, was gelöscht wird (Festlegung andre, 25.08.2026).**
Der Freigabedialog zeigt andre nur einen Pfad, nicht den Umfang — die Freigabe gilt aber für den
**gesamten Repo-Ordner**. Deshalb gilt: **Vor** jedem `allow_cowork_file_delete`-Aufruf im Chat
auflisten, welche Dateien konkret gelöscht werden sollen (Pfad und, wo sinnvoll, Größe/Datum) und
wozu. Eine Freigabe ohne diese Liste ist nicht zulässig — auch nicht für „offensichtliche"
Sperrdateien. Werden später weitere Dateien zum Löschen fällig, wird erneut aufgelistet, bevor
gelöscht wird; die einmal erteilte Ordner-Freigabe ist **keine** Blankovollmacht.
Für unbeaufsichtigte Läufe (geplante Aufgabe, nächtlicher Lauf): nur Sperrdateien
(`*.lock`, `tmp_obj_*`) unterhalb von `.git/` löschen, alles andere liegen lassen und im Bericht
nennen.

## Push safety — large files & bulk binaries

Before committing or pushing any file larger than ~50 MB (the GitHub recommended-size limit) or bulk binaries (PDFs, images, datasets, media, large docx/xlsx), STOP and warn andre first — list the files and their sizes and offer options (`.gitignore` / keep local, Git LFS, or proceed). Never push large binaries into git history without explicit confirmation; history bloat is hard to undo once pushed. Applies to every portfolio repo.

## 🔴 Neue Dateien nie automatisch committen — erst fragen

Verbindlich seit 21.08.2026 (Festlegung andre). **Ungetrackte Dateien werden von
keiner Session und keinem Automatiklauf committet** — auch nicht im Push-Sweep.
Kein `git add -A`, kein `git add .`, keine Ausnahme „ist ja offensichtlich harmlos".

Der Grund ist nicht Ordnungsliebe: andre legt laufend neue Dateien ab und kann bei
jeder einzelnen nicht gefragt werden, solange er nicht da ist. Also ist der
Standardzustand **liegenlassen**, und die Frage kommt gebündelt, wenn er wieder da ist.

Ablauf:

1. **Bei Sessionstart** `git status --porcelain` lesen. Alles unter „untracked" (`??`)
   ist unentschieden — nicht committen.
2. **andre die Liste vorlegen**, sobald er im Gespräch ist: Pfad, Größe, Datum. Kurz,
   als Aufzählung, ohne Vermutungen über den Inhalt.
3. Je Datei entscheidet er: **committen**, **ignorieren** (`.gitignore`) oder
   **vertraulich** (`.gitignore` **und** `CONFIDENTIAL.md` — nur PROM-admin führt diese Liste).
4. Erst danach handeln. Committet werden ausschließlich **namentlich genannte Pfade**:
   bereits getrackte Dateien oder solche, denen andre gerade zugestimmt hat.

Läuft die Session unbeaufsichtigt (geplante Aufgabe, nächtlicher Lauf), entfällt Schritt 2
ersatzlos — die Dateien bleiben liegen und werden im Bericht genannt. Nichts wird
„vorsichtshalber" mitgenommen.

**Anlass:** Am 21.08.2026 lag `FINANZEN/90525_40115_2026_Chefübersicht Flexibel A4 Quer
Nr. 1.xlsx` ungetrackt in PROM-admin — eine vertrauliche Chefübersicht. Der bestehende
Ausschluss `FINANZEN/ProMetronics_Chef*bersicht/` ist ein *Ordner*muster und griff bei
der losen Datei nicht. Ein Sweep mit `git add -A` hätte sie in die History gepusht.

Gilt für jedes Portfolio-Repo.

## Offene Aufgaben (TODO.md) — Sessions-Gedächtnis

Dieses Repo führt seine offenen Aufgaben in `TODO.md` im Repo-Root. Verbindliche Konvention (portfolio-weit, alle 8 Repos):

1. **Sessionstart:** `TODO.md` lesen und als Arbeitsgrundlage der Session laden.
2. **Laufend / Sessionende:** Erledigtes abhaken oder entfernen, Neues eintragen — spätestens vor dem Push-Sweep.
3. `TODO.md` ist getrackt und wird mit dem Sweep gepusht. Keine vertraulichen Details in die Liste — nur Verweise auf Dateien.

Die Liste ist das Sitzungs-Gedächtnis für offene Punkte; sie ersetzt weder Projektplan noch Issues/Jira.
