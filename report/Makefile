# Makefile — build the PFE report.
#
# Renders the PlantUML figures whose source (.puml) is newer than the
# rendered .pdf, then compiles the report with latexmk into the build/
# directory (so aux/log/toc/… never clutter report/). LaTeX does NOT
# regenerate figures itself — it only embeds the existing .pdf — so an edit
# to a .puml shows up in the report only after the figure is re-rendered.
# This Makefile automates exactly that, re-rendering ONLY the stale figures.
#
# Run from this directory (pfe-report/report/).
#
# Targets:
#   make            render stale figures, build, deliver report-idris.pdf (default)
#   make watch      keep running: rebuild automatically on every change to
#                   any .tex / .puml / puml-style.iuml / Makefile (Ctrl-C stops)
#   make figures    (re)render only the stale .puml -> .pdf
#   make force      re-render ALL figures, then build
#   make clean      remove LaTeX aux files (keeps figure PDFs)
#   make cleanall   also remove the generated figure PDFs and delivered PDF
#
# The final PDF is delivered to the repo root (one level up) as report-idris.pdf.
#
# Requires: plantuml, rsvg-convert (librsvg), latexmk.

# The LaTeX main file is report-idris.tex; latexmk compiles it into
# $(BUILD)/ and the $(OUT) rule delivers the PDF to the repo root.
MAIN    := report-idris
# All LaTeX intermediates (.aux/.log/.toc/.mtc*/…) land here, not in report/.
BUILD   := build
# The compiled PDF, inside the build dir.
PDF     := $(BUILD)/$(MAIN).pdf
# Final PDF delivered to the repo root (one level up) under this name.
OUT     := ../report-idris.pdf
PUML    := $(shell find . -name '*.puml')
FIG_PDF := $(PUML:.puml=.pdf)
TEX     := $(shell find . -name '*.tex')

.PHONY: all watch figures force clean cleanall

all: $(OUT)

# Deliver the freshly built PDF to the repo root as report-idris.pdf.
$(OUT): $(PDF)
	@cp $< $@
	@echo "  [out] $@"

# One figure: PlantUML -> SVG (pipe mode: read stdin, write stdout, so the
# output name never depends on the @startuml id) -> PDF via rsvg-convert.
# Make rebuilds this when the .puml OR the shared graphic charter
# (puml-style.iuml, injected via -I so every figure shares one look) is
# newer than the .pdf.
%.pdf: %.puml puml-style.iuml
	@echo "  [puml] $< -> $@"
	@plantuml -tsvg -p -I puml-style.iuml < $< > $@.svg
	@rsvg-convert -f pdf -o $@ $@.svg
	@rm -f $@.svg

figures: $(FIG_PDF)

# Build the report once every figure is current. latexmk runs its own
# multi-pass / bibtex logic and only recompiles when something changed.
# -outdir keeps every intermediate (and report.pdf) inside $(BUILD)/.
# Each \include writes a per-chapter .aux beside itself *within* the outdir,
# so mirror those subdirs first — in nonstopmode a missing one is fatal.
$(PDF): $(FIG_PDF) $(TEX)
	@mkdir -p $(BUILD)
	@grep -hoE '\\include\{[^}]+\}' $(MAIN).tex \
	  | sed -E 's/.*\{([^}]+)\}/\1/' | xargs -n1 dirname | sort -u \
	  | while read d; do mkdir -p "$(BUILD)/$$d"; done
	latexmk -pdf -outdir=$(BUILD) -interaction=nonstopmode $(MAIN).tex

# Force a full figure re-render (e.g. after a skinparam/theme change).
force:
	@touch $(PUML)
	@$(MAKE) --no-print-directory all

# Continuous build: poll every 2 s; when any source file (.tex, .puml,
# puml-style.iuml, Makefile) has been modified since the last attempt,
# run a full incremental build. A failed build waits for the next save
# instead of retrying in a loop. Ctrl-C to stop.
STAMP := $(BUILD)/.watch-stamp
watch:
	@mkdir -p $(BUILD)
	@echo "watch: initial build…"
	@touch $(STAMP)
	@$(MAKE) --no-print-directory all || echo "watch: BUILD FAILED — fix and save to retry"
	@echo "watch: watching for changes (Ctrl-C to stop)"
	@while true; do \
	  if [ -n "$$(find . \( -name '*.tex' -o -name '*.puml' -o -name '*.iuml' -o -name 'Makefile' \) -newer $(STAMP) -print -quit 2>/dev/null)" ]; then \
	    touch $(STAMP); \
	    echo "watch: change detected at $$(date +%H:%M:%S) — rebuilding…"; \
	    $(MAKE) --no-print-directory all && echo "watch: done ($$(date +%H:%M:%S))" \
	      || echo "watch: BUILD FAILED — fix and save to retry"; \
	  fi; \
	  sleep 2; \
	done

clean:
	latexmk -c -outdir=$(BUILD) $(MAIN).tex

cleanall: clean
	rm -rf $(BUILD)
	rm -f $(FIG_PDF) $(OUT)
