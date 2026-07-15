# roadmap-tools

The actual rendering pipeline (Python + Jinja2 templates) lives in
`PROM-Portfolio/roadmap-tools/`. This folder is a placeholder for project-scoped
tooling overrides — for example, custom render templates that diverge from the
portfolio default.

## Quick start

To regenerate this project's Gantt:

```bash
cd ../PROM-Portfolio/roadmap-tools
python run_all.py
```

The output is written to `PROM-Portfolio/roadmap/leonardo-ftir_gantt.html` (gitignored —
regenerate from YAML).

## When to add files here

- A render template that should differ from the portfolio default.
- A project-specific data extraction script.
- Generally, prefer extending the portfolio tools instead of duplicating them here.
