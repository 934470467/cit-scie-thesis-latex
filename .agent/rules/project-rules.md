# 核心架构边界 (Core Architecture Boundaries)

## ❌ 严禁修改 (DO NOT MODIFY)
以下文件和目录构成了常州工学院 LaTeX 模板的核心基础架构。未经授权的 AI 或用户**严禁**修改这些文件，否则会导致格式不符合学校规范：
1. `graduate-design-manual.cls` (核心类文件，定义了所有格式规范)
2. `Makefile` (标准编译入口)
3. `fonts/` (本地字体库)
4. `gbt7714/` (国标参考文献样式)
5. `scripts/build.sh` 和 `scripts/build.bat` (自动化编译脚本)

## ✅ 允许修改 (SAFE TO MODIFY)
AI 可以协助用户在以下范围内进行修改、扩充和优化：
1. `report.tex` (论文主文件及章节内容)
2. `report.bib` (参考文献数据)
3. `figures/` (添加、修改用户自己的插图)

## 📌 执行策略 (Execution Strategy)
- 当用户要求“修改格式”时，必须首先检查 `.cls` 文件是否已经提供相关配置。**禁止**在 `report.tex` 中强行使用如 `\vspace`, `\hspace`, 或覆盖原有宏包配置的命令。
- 所有编译操作必须引导用户通过 `scripts/build.sh` (Mac/Linux) 或 `scripts/build.bat` (Windows) 进行，而不是手动输入单条命令。
