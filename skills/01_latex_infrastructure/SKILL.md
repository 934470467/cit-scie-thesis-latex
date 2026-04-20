---
name: 01_latex_infrastructure
description: LaTeX 模版用法与项目结构配置，让 AI 快速熟悉编译流与修改规范
---

# LaTeX 基础设施与模板管控

## 1. 项目编译工作流
本项目主要用于常工院(CZU)毕业设计模板的编写。推荐本地 VS Code 配合 TeX Live。

- **依赖环境**：完整 TeX Live 发行版。
- **标准编译链** (四次编译确保交叉引用和文献正确)：
  `xelatex -> bibtex -> xelatex -> xelatex` (以 `main.tex` 为入口)

## 2. 目录结构与修改规范
核心原则：修改前编译验证；改一处编译一次。

- **`*.cls` (高风险)**：格式定义。修改格式时搜索 `\chapter` (标题), `\linespread` (行距), `\zihao` (字号) 等。
- **`main.tex` (中风险)**：入口文件。仅用于填写基本信息 (`\title`, `\author`, `\studentid` 等) 及组装章节 (`\input{chapters/xx}`)。
- **`chapters/*.tex` (低风险)**：正文内容。只写内容，不碰 `\makechaptertitle` 或 `\ifthesis` 等格式宏。

## 3. 常用操作与排错
- **增删章节**：在 `chapters/` 新增 `.tex`，并在 `main.tex` 中 `\input{}`。
- **参考文献**：使用 `\usepackage[backend=biber,style=gb7714-2015]{biblatex}` 或标准的 BibTeX 流程。
- **排错速查**：
  - `Undefined control sequence`：拼写错误/未引宏包。
  - `File not found`：检查路径是否包含反斜杠，需用正斜杠 `/`。
  - `Missing $ inserted`：公式未加 `$` 或未放入 math mode。
