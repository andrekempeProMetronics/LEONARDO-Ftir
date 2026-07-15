#!/usr/bin/env bash
# Render Spero_Publications_Overview.md -> PDF with a running header
# (ProMetronics logo top-right on every page). Requires: pandoc + xelatex + DejaVu fonts.
set -euo pipefail
cd "$(dirname "$0")"
LOGO="$(pwd)/assets/ProMetronics-Logo.png"
TMP="$(mktemp -d)"
python3 - "$LOGO" > "$TMP/report.md" <<'PY'
import re,sys
s=open("Spero_Publications_Overview.md",encoding="utf-8").read()
s=re.sub(r'^<img src="assets/ProMetronics-Logo\.png"[^>]*>\s*\n','',s,flags=re.M)
s=s.replace("<sub>","").replace("</sub>","")
def repl(m):
    t=m.group(0)
    src=re.search(r'src="([^"]+)"',t).group(1)
    alt=(re.search(r'alt="([^"]*)"',t) or [None,""])[1] if re.search(r'alt="([^"]*)"',t) else ""
    w=int((re.search(r'width="(\d+)"',t) or [None,"600"]).group(1)) if re.search(r'width="(\d+)"',t) else 600
    p=max(45,min(80,round(w*0.11)))
    return f'![{alt}]({src})'+'{'+f'width={p}%'+'}'
s=re.sub(r'<img [^>]*>',repl,s)
sys.stdout.write(s)
PY
cat > "$TMP/header.tex" <<EOF
\\usepackage{fancyhdr}\\usepackage{graphicx}\\usepackage{lastpage}\\usepackage{xcolor}
\\definecolor{promgray}{HTML}{5A6472}
\\pagestyle{fancy}\\fancyhf{}
\\renewcommand{\\headrulewidth}{0.4pt}\\renewcommand{\\footrulewidth}{0pt}
\\setlength{\\headheight}{32pt}
\\lhead{\\footnotesize\\textcolor{promgray}{Spero (QCL-IR) Publications — Analytical Overview\\\\ProMetronics GmbH · LEONARDO-Ftir · v20}}
\\rhead{\\raisebox{-0.30cm}{\\includegraphics[height=0.95cm]{$LOGO}}}
\\cfoot{\\footnotesize\\textcolor{promgray}{\\thepage\\ / \\pageref{LastPage}}}
\\fancypagestyle{plain}{\\fancyhf{}\\renewcommand{\\headrulewidth}{0.4pt}%
\\lhead{\\footnotesize\\textcolor{promgray}{Spero (QCL-IR) Publications — Analytical Overview\\\\ProMetronics GmbH · LEONARDO-Ftir · v20}}%
\\rhead{\\raisebox{-0.30cm}{\\includegraphics[height=0.95cm]{$LOGO}}}%
\\cfoot{\\footnotesize\\textcolor{promgray}{\\thepage\\ / \\pageref{LastPage}}}}
EOF
pandoc "$TMP/report.md" -o Spero_Publications_Overview.pdf --pdf-engine=xelatex -H "$TMP/header.tex" \
  -V geometry:"top=3cm,bottom=2cm,left=2cm,right=2cm" \
  -V mainfont="DejaVu Serif" -V monofont="DejaVu Sans Mono" -V fontsize=10pt \
  -V colorlinks=true --resource-path="$(pwd)"
rm -rf "$TMP"
echo "wrote Spero_Publications_Overview.pdf"
