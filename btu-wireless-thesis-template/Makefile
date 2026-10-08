# ==============================================================================
# Makefile for BTU Wireless Systems Master's Thesis Template
# Supports Linux, macOS, and Windows (with make)
# ==============================================================================

LATEX = pdflatex -interaction=nonstopmode -halt-on-error
BIBER = biber
MAIN = main
DECL = declaration_standalone

.PHONY: all main declaration clean distclean help

all: main declaration

main: $(MAIN).tex
	@echo "==> [Pass 1] pdflatex..."
	$(LATEX) $(MAIN).tex
	@echo "==> Running Biber..."
	$(BIBER) $(MAIN)
	@echo "==> [Pass 2] pdflatex..."
	$(LATEX) $(MAIN).tex
	@echo "==> [Pass 3] pdflatex (Finalizing TOC & references)..."
	$(LATEX) $(MAIN).tex
	@echo "==> Compilation complete: $(MAIN).pdf generated successfully."

declaration: $(DECL).tex
	@echo "==> Compiling standalone affidavit..."
	$(LATEX) $(DECL).tex
	@echo "==> Standalone affidavit generated: $(DECL).pdf."

clean:
	@echo "==> Cleaning auxiliary files..."
	rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.lof *.log *.lot *.out *.run.xml *.synctex.gz *.toc *.acn *.acr *.alg
	rm -f frontmatter/*.aux chapters/*.aux appendices/*.aux

distclean: clean
	@echo "==> Cleaning PDFs..."
	rm -f $(MAIN).pdf $(DECL).pdf

help:
	@echo "Available make targets:"
	@echo "  make              - Compiles both main.pdf and declaration_standalone.pdf"
	@echo "  make main         - Compiles full thesis (main.pdf)"
	@echo "  make declaration  - Compiles 1-page standalone affidavit (declaration_standalone.pdf)"
	@echo "  make clean        - Removes auxiliary LaTeX files"
	@echo "  make distclean    - Removes auxiliary files and generated PDFs"
