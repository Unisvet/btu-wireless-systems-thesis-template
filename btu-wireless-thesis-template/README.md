# BTU Cottbus–Senftenberg: Chair of Wireless Systems (Fachgebiet Drahtlose Systeme)
## Master's Thesis LaTeX Template & Starter Kit

[![Compile LaTeX Thesis](https://github.com/your-username/your-repo/actions/workflows/compile.yml/badge.svg)](https://github.com/your-username/your-repo/actions)
[![LaTeX](https://img.shields.io/badge/LaTeX-KOMA--Script-blue.svg)](https://komascript.de/)
[![BibLaTeX](https://img.shields.io/badge/biblatex-biber-green.svg)](https://www.ctan.org/pkg/biblatex)
[![Chair](https://img.shields.io/badge/BTU-Wireless%20Systems-ba0032.svg)](https://www.b-tu.de/en/fg-drahtlose-systeme)

Official, modernized LaTeX template for Master's theses (and Bachelor's theses) conducted at the **Chair of Wireless Systems (Fachgebiet Drahtlose Systeme)**, Faculty 1 – MINT / Institute for Computer Science, Brandenburg University of Technology Cottbus–Senftenberg (BTU).

---

## 📌 Key Highlights

- **Bilingual & Configurable**: Switch the entire thesis between English (`english`) and German (`ngerman`) with a single toggle in `metadata.tex`.
- **Mandatory AI Declaration Compliant**: Strictly realizes the Chair's mandatory **Declaration of Authenticity regarding Generative AI tools** (both embedded in the thesis and available as a 1-page standalone PDF for Day 1 topic assignment).
- **Modern Typography & Brand Identity**: Set in Palatino (`newpxtext`/`newpxmath`) with Helvetica headers, official BTU corporate colors (`#BA0032`), and crisp vector logos.
- **Engineered Chapter Guidelines**: Every chapter file (`chapters/01_introduction.tex` through `chapters/08_conclusion.tex`) contains an embedded *Student Writing Guide* and a *Chapter Takeaway Box* clarifying exact chair expectations.
- **Complete Feature Stack**: Pre-configured IEEE bibliography (`biblatex` + `biber`), code listings with syntax highlighting (`listings`), mathematical algorithms (`algpseudocode`), subfigures (`subcaption`), physical SI units (`siunitx`), acronym management (`acronym`), and clever cross-referencing (`cleveref`).
- **Multi-Platform Support**: Works out-of-the-box in **Overleaf**, **VS Code** (with LaTeX Workshop), **MiKTeX / TeX Live**, and automated **GitHub Actions CI**.

---

## 📂 Repository Structure

```text
btu-wireless-thesis-template/
├── metadata.tex                  # <--- YOUR CONFIGURATION (author, title, supervisors, AI usage)
├── settings.tex                  # Package stack, typography, BTU colors & styles
├── main.tex                      # Root driver document
├── declaration_standalone.tex    # Standalone 1-page PDF compiler for topic assignment
├── compile.ps1                   # One-click Windows PowerShell build script
├── Makefile                      # Standard GNU Make build script (Linux/macOS/CI)
├── README.md                     # This manual
├── GUIDELINES_FOR_STUDENTS.md    # In-depth scientific structuring recommendations
├── figures/                      # Image assets (BTU logos, plots, diagrams)
│   ├── btu_logo_en.png
│   └── btu_logo_de.pdf
├── frontmatter/                  # Preliminary pages
│   ├── titlepage.tex             # Official BTU cover layout
│   ├── declaration.tex           # Chair-mandated AI declaration and signature block
│   ├── abstract.tex              # English Abstract & German Kurzfassung
│   ├── acknowledgments.tex       # Acknowledgments
│   └── acronyms.tex              # List of abbreviations (\ac{...})
├── chapters/                     # Core thesis body
│   ├── 01_introduction.tex       # Motivation, Problem Statement, RQs, Contributions
│   ├── 02_background.tex         # Technical foundations & theory
│   ├── 03_related_work.tex       # State of the art, taxonomy table & research gap
│   ├── 04_methodology.tex        # System architecture, formal models & algorithms
│   ├── 05_implementation.tex     # Testbed specs, software stack & code listings
│   ├── 06_evaluation.tex         # Benchmarks, trade-off figures & ablation study
│   ├── 07_discussion.tex         # Interpretation, failure analysis & threats to validity
│   └── 08_conclusion.tex         # Summary, answers to RQs & future research
├── appendices/                   # Supplementary material
│   ├── appendix_a_reproducibility.tex # Reproducibility checklist & code links
│   └── appendix_b_extended_data.tex   # Hyperparameter grids & raw testbed data
└── bibliography/
    └── references.bib            # BibTeX database
```

---

## 🚀 Quick Start Guide

### Step 1: Configure Your Metadata
Open `metadata.tex` and fill in your details:
```latex
\newcommand{\ThesisTitle}{Your Thesis Title Here}
\newcommand{\AuthorName}{Max Mustermann}
\newcommand{\StudentId}{1234567}
\newcommand{\DegreeProgram}{Master} % or 'Bachelor' (e.g. Master Artificial Intelligence, Cyber Security)
\newcommand{\PrimarySupervisor}{Prof. Dr. rer. nat. Peter Langendörfer}
\newcommand{\SecondarySupervisor}{Dr. rer. nat. Svetlana Meissner}
\newcommand{\ThesisLanguage}{english} % or 'ngerman'
```

### Step 2: Declare AI Tool Usage (Mandatory Chair Policy)
The Chair of Wireless Systems requires students to declare the usage of AI tools (ChatGPT, GitHub Copilot, Gemini, Claude, etc.):
```latex
\newcommand{\AiUsed}{true} % or 'false'
\newcommand{\AiToolsList}{ChatGPT-4o (OpenAI), GitHub Copilot (GitHub)}
\newcommand{\AiPurpose}{ChatGPT was utilized for grammar refinement in Chapters 1--3; GitHub Copilot assisted in generating unit tests.}
```
*Note*: If you have physically printed and signed the declaration page, place the scan as `figures/declaration_signed.pdf` and set `\newcommand{\IncludeSignedDeclarationScan}{true}` to automatically embed the signed scan!

### Step 3: Compiling Your Thesis

#### Option A: Overleaf (Cloud)
1. Zip the `btu-wireless-thesis-template/` directory.
2. In Overleaf, click **New Project** $\to$ **Upload Project** and select the `.zip`.
3. Set the compiler to **pdfLaTeX** and TeX Live version to **2024 or later** in Overleaf Settings.
4. Ensure the main document is set to `main.tex`.

#### Option B: Windows (PowerShell)
Double-click or run from PowerShell:
```powershell
.\compile.ps1
```
To compile only the 1-page standalone affidavit for day-1 topic assignment:
```powershell
.\compile.ps1 -Target declaration
```

#### Option C: Linux / macOS / Terminal
Use the included `Makefile`:
```bash
make            # Compiles main.pdf and declaration_standalone.pdf
make main       # Compiles main.pdf
make declaration# Compiles declaration_standalone.pdf
make clean      # Cleans auxiliary files
```

#### Option D: VS Code (LaTeX Workshop)
1. Install the **LaTeX Workshop** extension in VS Code.
2. Open `btu-wireless-thesis-template/`.
3. Set recipe to `pdflatex -> biber -> pdflatex*2` (default standard recipe).
4. Save `main.tex` to auto-compile.

---

## 📋 The Two-Stage AI Affidavit Requirement
Under official Chair regulations ([BTU Wireless Systems Thesis Guidelines](https://www.b-tu.de/en/fg-drahtlose-systeme/teaching/thesis)):

1. **Stage 1 (Topic Assignment - Day 1)**:
   - When you are assigned a topic, compile `declaration_standalone.tex` to produce a 1-page PDF.
   - Print or digitally sign this affidavit, and submit it to the Chair (Ms. Elisabeth Vogel M.Sc.).
2. **Stage 2 (Final Submission)**:
   - Update `metadata.tex` with your final submission date and detailed list of AI tools utilized.
   - Include the declaration inside `main.tex` (either directly compiled or by attaching your signed scan).

---

## 📖 Structuring Recommendations
For detailed guidelines on how to formulate Research Questions, design evaluation experiments, and structure each chapter to meet chair standards, see:
👉 **[`GUIDELINES_FOR_STUDENTS.md`](./GUIDELINES_FOR_STUDENTS.md)**

---

## 🏛️ Supervision & Contact
- **Chairholder**: Prof. Dr. rer. nat. Peter Langendörfer
- **Academic Advisor**: Dr. rer. nat. Svetlana Meissner
- **Topic Assignment & Administration**: Ms. Elisabeth Vogel M.Sc. (`Elisabeth.Vogel@b-tu.de`)
- **Website**: [Chair of Wireless Systems, BTU Cottbus–Senftenberg](https://www.b-tu.de/en/fg-drahtlose-systeme)
