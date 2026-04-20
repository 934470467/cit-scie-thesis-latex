# 常州工学院毕业设计说明书（论文）LaTeX 模板

本模板依据《常州工学院计算机信息工程学院毕业设计说明书（论文）格式规范》定制开发。旨在为常州工学院计算机学院的学生提供一个标准化的 LaTeX 排版环境，自动处理封面绘制、目录生成、中英文摘要、正文格式、公式编号、参考文献引用等繁琐的排版工作，让你专注于论文内容本身。

## 🛠️ 环境要求
- **LaTeX 编译器**: 必须使用 **XeLaTeX**（以支持 `xeCJK` 宏包和本地字体调用）。
- **参考文献工具**: **BibTeX** (配合 `gbt7714` 样式)。
- **操作系统**: Windows / macOS / Linux (已配置跨平台字体路径兼容)。

## ⚙️ 编译方式
本项目支持 [Overleaf 在线编译](docs/overleaf-tutorial.md) 以及本地通过 VSCode (LaTeX Workshop)、TeXstudio 等主流工具编译。
请始终确保使用 **XeLaTeX + BibTeX** 完成论文编译。

此外，我们也提供了基于 `make` 的命令行自动化编译方式：
```bash
# 编译命令：项目根目录只保留最终生成的 report.pdf，所有中间文件会输出到 .tmp/
make

# 删除中间过程文件
make clean

# 删除中间过程文件和最终的 pdf
make distclean
```

---

## 🚀 核心文档指引 (Documentation)

为了保持项目极简，我们将详细的教程和 AI 规则收敛到了 `docs/` 目录中。请根据你的需求点击查阅：

- 🎓 **[小白首选：Overleaf 免配置开箱即用图文教程](docs/overleaf-tutorial.md)**
- 📖 **[核心：LaTeX 基础与模板本地编译指南](docs/latex-guide.md)**
- 🛠️ **[救急：编译排错与社区支持资源大全](docs/troubleshooting.md)**

---

## 🤖 AI 快速开始 (Vibe Coding)

本项目原生支持与 AI 编程助手（如 Cursor, Copilot 等）协同工作，并进行了严格的 **Vibe Coding** 架构约束。

👉 **[点击查阅：面向开发者的 Vibe Coding 架构与约束](docs/README.md#面向开发者的-vibe-coding-架构与约束)**

> **给 AI 的指令 (System Prompt)：**
> 接手项目时，必须首先读取 `prds/prd.md` 获取当前目标，并在 `context/context.txt` 中严格记录每一步动作。绝对禁止破坏 `.cls` 核心样式。在执行具体开发或排错动作前，请**务必先查阅 `.agent/README.md`** 挂载对应的专业技能 SOP。

---

## 📁 目录结构快览

```text
.
├── graduate-design-manual.cls   # 核心类文件：定义了论文规范（勿动！）
├── report.tex                   # 论文主文件：你写论文的地方（⭐重点）
├── report.bib                   # 参考文献数据文件
├── .agent/                      # AI 配置中心 (rules, skills)
├── context/                     # 项目上下文记忆 (context.txt, memory.md)
├── prds/                        # PRD 任务定义 (prd.md, prd.json)
├── docs/                        # 用户教程与文档
├── scripts/                     # 自动化编译脚本 (.sh / .bat)
├── fonts/                       # 本地字体库
├── figures/                     # 插图文件夹
└── gbt7714/                     # 参考文献 GB/T 7714 标准样式包
```
