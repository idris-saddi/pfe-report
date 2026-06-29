# Makefile — build the PFE report.
#
# Renders the PlantUML figures whose source (.puml) is newer than the
# rendered .pdf, then compiles report.pdf with latexmk. LaTeX does NOT
# regenerate figures itself — it only embeds the existing .pdf — so an edit
# to a .puml shows up in the report only after the figure is re-rendered.
# This Makefile automates exactly that, re-rendering ONLY the stale figures.
#
# Run from this directory (pfe-report/report/).
#
# Targets:
#   make            render stale figures, then build report.pdf   (default)
#   make figures    (re)render only the stale .puml -> .pdf
#   make force      re-render ALL figures, then build
#   make clean      remove LaTeX aux files (keeps figure PDFs)
#   make cleanall   also remove the generated figure PDFs
#
# Requires: plantuml, rsvg-convert (librsvg), latexmk.

MAIN    := report
PUML    := $(shell find . -name '*.puml')
FIG_PDF := $(PUML:.puml=.pdf)
TEX     := $(shell find . -name '*.tex')

.PHONY: all figures force clean cleanall

all: $(MAIN).pdf

# One figure: PlantUML -> SVG (pipe mode: read stdin, write stdout, so the
# output name never depends on the @startuml id) -> PDF via rsvg-convert.
# Make rebuilds this only when the .puml is newer than the .pdf.
%.pdf: %.puml
	@echo "  [puml] $< -> $@"
	@plantuml -tsvg -p < $< > $@.svg
	@rsvg-convert -f pdf -o $@ $@.svg
	@rm -f $@.svg

figures: $(FIG_PDF)

# Build the report once every figure is current. latexmk runs its own
# multi-pass / bibtex logic and only recompiles when something changed.
$(MAIN).pdf: $(FIG_PDF) $(TEX)
	latexmk -pdf -interaction=nonstopmode $(MAIN).tex

# Force a full figure re-render (e.g. after a skinparam/theme change).
force:
	@touch $(PUML)
	@$(MAKE) --no-print-directory all

clean:
	latexmk -c $(MAIN).tex

cleanall: clean
	rm -f $(FIG_PDF)
