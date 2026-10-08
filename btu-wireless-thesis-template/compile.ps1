<#
.SYNOPSIS
    Automated LaTeX build script for BTU Wireless Systems Thesis Template (Windows / PowerShell)

.DESCRIPTION
    Runs pdflatex -> biber -> pdflatex -> pdflatex to resolve all citations,
    cross-references, acronyms, and tables of contents.
    Optionally compiles the standalone day-1 Declaration of Authenticity (Affidavit).

.PARAMETER Target
    "all" (default) - compiles main.tex and declaration_standalone.tex
    "main"          - compiles only main.tex
    "declaration"   - compiles only declaration_standalone.tex
    "clean"         - cleans auxiliary files

.EXAMPLE
    .\compile.ps1
    .\compile.ps1 -Target main
    .\compile.ps1 -Target clean
#>

param (
    [string]$Target = "all"
)

$ErrorActionPreference = "Stop"

function Clean-AuxFiles {
    Write-Host "[Clean] Removing LaTeX auxiliary files..." -ForegroundColor Yellow
    $extensions = @("*.aux", "*.bbl", "*.bcf", "*.blg", "*.fdb_latexmk", "*.fls", "*.lof", "*.log", "*.lot", "*.out", "*.run.xml", "*.synctex.gz", "*.toc", "*.acn", "*.acr", "*.alg")
    foreach ($ext in $extensions) {
        Get-ChildItem -Path . -Filter $ext -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
    }
    Write-Host "[Clean] Auxiliary files removed." -ForegroundColor Green
}

function Build-Main {
    Write-Host "`n========================================================" -ForegroundColor Cyan
    Write-Host " Building Thesis: main.tex" -ForegroundColor Cyan
    Write-Host "========================================================" -ForegroundColor Cyan
    
    Write-Host "[Step 1/4] pdflatex (Pass 1)..." -ForegroundColor Magenta
    pdflatex -interaction=nonstopmode -halt-on-error main.tex | Out-Null
    
    Write-Host "[Step 2/4] biber bibliography..." -ForegroundColor Magenta
    biber main | Out-Null
    
    Write-Host "[Step 3/4] pdflatex (Pass 2 - Citations & Links)..." -ForegroundColor Magenta
    pdflatex -interaction=nonstopmode -halt-on-error main.tex | Out-Null
    
    Write-Host "[Step 4/4] pdflatex (Pass 3 - Final Cross-refs & TOC)..." -ForegroundColor Magenta
    pdflatex -interaction=nonstopmode -halt-on-error main.tex | Out-Null
    
    if (Test-Path "main.pdf") {
        $size = (Get-Item "main.pdf").Length / 1KB
        Write-Host "`n[SUCCESS] main.pdf successfully compiled! ($([math]::Round($size, 1)) KB)" -ForegroundColor Green
    } else {
        Write-Error "[FAILED] main.pdf was not produced. Check main.log."
    }
}

function Build-Declaration {
    Write-Host "`n========================================================" -ForegroundColor Cyan
    Write-Host " Building Standalone Affidavit: declaration_standalone.tex" -ForegroundColor Cyan
    Write-Host "========================================================" -ForegroundColor Cyan
    
    Write-Host "[Step 1/1] pdflatex declaration_standalone.tex..." -ForegroundColor Magenta
    pdflatex -interaction=nonstopmode -halt-on-error declaration_standalone.tex | Out-Null
    
    if (Test-Path "declaration_standalone.pdf") {
        Write-Host "`n[SUCCESS] declaration_standalone.pdf generated (1 page)!" -ForegroundColor Green
    } else {
        Write-Error "[FAILED] declaration_standalone.pdf failed. Check declaration_standalone.log."
    }
}

switch ($Target.ToLower()) {
    "clean" {
        Clean-AuxFiles
    }
    "main" {
        Build-Main
    }
    "declaration" {
        Build-Declaration
    }
    "all" {
        Build-Main
        Build-Declaration
    }
    default {
        Write-Host "Unknown target: $Target. Available: all, main, declaration, clean" -ForegroundColor Red
    }
}
