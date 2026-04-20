@echo off
setlocal enabledelayedexpansion

:: 错误处理：遇到错误立即退出
if %errorlevel% neq 0 exit /b %errorlevel%

:: 获取脚本所在的父目录，即项目根目录
set "SCRIPT_DIR=%~dp0"
set "TARGET_DIR=%SCRIPT_DIR%.."
cd /d "%TARGET_DIR%" || (
    echo 错误：找不到目录 %TARGET_DIR%
    pause
    exit /b 1
)

echo 正在编译LaTeX论文 (report.tex)...
echo 编译目录：%TARGET_DIR%

:: 执行标准编译流程 (XeLaTeX + BibTeX + 两次XeLaTeX)
echo 第一步：第一次XeLaTeX编译...
xelatex -interaction=nonstopmode report.tex
if %errorlevel% neq 0 (
    echo 错误：第一次XeLaTeX编译失败！
    pause
    exit /b 1
)

echo 第二步：BibTeX处理参考文献...
bibtex report >nul 2>&1 || (
    echo 警告：无参考文献或BibTeX执行失败，继续编译...
)

echo 第三步：第二次XeLaTeX编译（更新引用）...
xelatex -interaction=nonstopmode report.tex

echo 第四步：第三次XeLaTeX编译（更新目录）...
xelatex -interaction=nonstopmode report.tex

:: 检查是否成功生成 PDF
if exist "report.pdf" (
    echo 编译成功！PDF文件已生成。
) else (
    echo 错误：未生成report.pdf，编译失败！
    pause
    exit /b 1
)

:: 清理中间文件
del /f /q *.aux *.log *.out *.toc *.bbl *.blg *.run.xml *.bcf *.thm >nul 2>&1
echo 已清理中间临时文件

pause
endlocal
