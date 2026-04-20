---
name: 01_latex_infrastructure
description: LaTeX 模版用法与项目结构配置，让 AI 快速熟悉编译流与修改规范
---

# LaTeX 基础设施与模板管控

## 1. 项目编译工作流
本项目主要用于常工院(CZU)毕业设计模板的编写。推荐本地 VS Code 配合 TeX Live。

- **依赖环境**：完整 TeX Live 发行版。
- **编译方式**：运行 `scripts/build.sh` (Mac/Linux) 或 `scripts/build.bat` (Windows)。
- **标准编译链** (四次编译确保交叉引用和文献正确)：
  `xelatex -> bibtex -> xelatex -> xelatex` (以 `report.tex` 为入口)

## 2. 项目结构与修改规范
核心原则：修改前编译验证；改一处编译一次。本项目采用**单文件架构**。

- **`graduate-design-manual.cls` (禁区)**：格式定义，严禁修改。
- **`report.tex` (核心工作区)**：论文唯一主文件，包含元信息(`\title`, `\author`等)和全部章节正文。AI 协助用户直接在此文件中编写和修改内容。
- **`report.bib` (低风险)**：参考文献数据库。
- **`figures/` (低风险)**：所有插图统一存放于此目录。引用格式：`\includegraphics[width=0.9\textwidth]{figures/xxx.png}`。

## 3. 常用操作与排错
- **增删章节**：直接在 `report.tex` 中增删 `\section{}` / `\subsection{}` 块。
- **参考文献**：使用 `\bibliographystyle{gbt7714-numerical}` + `\bibliography{report}` 标准 BibTeX 流程。
- **排错速查**：
  - `Undefined control sequence`：拼写错误/未引宏包。
  - `File not found`：检查路径是否包含反斜杠，需用正斜杠 `/`。
  - `Missing $ inserted`：公式未加 `$` 或未放入 math mode。
