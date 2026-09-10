# Keep every LaTeX intermediate (and report.pdf) out of report/'s top level.
# Editor plugins (e.g. VS Code LaTeX Workshop) run latexmk and honour this,
# so on-save builds land in build/ exactly like `make` does. The delivered
# PDF remains ../report-idris.pdf, produced by the Makefile's copy step.
$out_dir = 'build';
