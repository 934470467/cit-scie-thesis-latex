#!/bin/bash
set -e

# 获取脚本所在的父目录，即项目根目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$ROOT_DIR"

echo "Building LaTeX Thesis (report.tex)..."

# 执行完整的四次编译流程 (xelatex -> bibtex -> xelatex -> xelatex)
xelatex -interaction=nonstopmode report.tex
bibtex report || true
xelatex -interaction=nonstopmode report.tex
xelatex -interaction=nonstopmode report.tex

echo "Successfully generated report.pdf"

# 清理辅助文件
rm -f *.aux *.log *.out *.toc *.bbl *.blg *.run.xml *.bcf *.thm
echo "Cleaned up auxiliary files."

