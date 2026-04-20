#!/bin/bash
set -e

# 获取当前脚本所在目录并进入 docs/manual
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
cd "$SCRIPT_DIR/../docs/manual"

echo "Building LaTeX Manual..."

# 配置 TEXINPUTS 环境变量以便 xelatex 能找到上级目录的模板与资源文件
# 注意：末尾的 : 不能省略，它代表默认搜索路径
export TEXINPUTS=".:../../:../../figures:../../fonts:../../gbt7714:$TEXINPUTS"

# 建立字体和图片的软链接，防止路径写死找不到
ln -snf ../../fonts fonts
ln -snf ../../figures figures
ln -snf ../../gbt7714 gbt7714

# 执行完整的四次编译流程 (xelatex -> bibtex -> xelatex -> xelatex)
xelatex -interaction=nonstopmode main.tex
bibtex main || true
xelatex -interaction=nonstopmode main.tex
xelatex -interaction=nonstopmode main.tex

# 将生成的 PDF 移动到根目录
mv main.pdf ../../LaTeX使用手册.pdf
echo "Successfully generated ../../LaTeX使用手册.pdf"

# 清理辅助文件
rm -f *.aux *.log *.out *.toc *.bbl *.blg *.run.xml *.bcf
echo "Cleaned up auxiliary files."
