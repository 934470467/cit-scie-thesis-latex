# 🤖 AI 专精技能与配置中心 (.agent)

> **[返回项目根目录 README](../README.md)** | **[前往 Docs 查看完整架构说明](../docs/README.md#面向开发者的-vibe-coding-架构与约束)**

本目录是当前毕业设计模板的核心“大脑”，存放了专为 AI 编程助手（如 Cursor, GitHub Copilot, Gemini 等）定制的**行为准则 (Rules)**与**专精技能 (Skills)**。

## 为什么要约束 AI？
普通的 AI 在面对 LaTeX 模板时，常常会因为缺乏垂直领域的知识而胡乱修改底层核心代码（如 `.cls`），或者生成毫无逻辑、格式混乱的“AI味”内容。
为了杜绝这一现象，我们将专家的“排版经验、排错流程、逻辑构建方法”提炼压缩成了这个目录下的标准化文件。当 AI 接手任务时，必须先**“外挂”**这里的知识，从而像一位真正的工业级工程师一样工作。

## 目录索引与核心 SOP 矩阵

### 1. `skills/` (必读核心包)
这里包含了项目所需的四项关键技能。**无论 AI 进行何种操作，都必须先读取对应的 SKILL.md 文件并严格遵守其中的指令。**

*   🛠️ **[01_latex_infrastructure](skills/01_latex_infrastructure/SKILL.md)**：LaTeX 基础设施维护。负责编译报错排查、环境隔离与底层样式保护。
*   📚 **[02_research_and_sourcing](skills/02_research_and_sourcing/SKILL.md)**：学术检索与分析。规定了如何用学术语言提取文献核心价值，避免无脑洗稿。
*   📊 **[03_content_and_graphics](skills/03_content_and_graphics/SKILL.md)**：内容构建与图表生成。提供了国内学位论文标准的 Python 绘图 SOP 与 Figma 重绘 SOP，以及消除“AI味”的扩写指令。
*   ⚙️ **[04_vibe_coding_engineering](skills/04_vibe_coding_engineering/SKILL.md)**：Vibe Coding 工程规范。约束 AI 的执行纪律（如先设计后执行、原子化记录、严禁破坏性覆盖）。

### 2. `rules/` (边界防线)
*   *(预留)*：用于存放更底层的项目边界规则，限制 AI 绝对不允许触碰的核心系统级文件。

## 🤖 开发者与 AI 协作准则 (系统提示词)
1. **优先挂载技能**：遇到不确定的 LaTeX 宏包冲突或画图报错，**绝对不许自己猜测**，必须先来 `skills/` 寻找对应的 SOP 解决方案。
2. **状态记录**：执行完本目录下的指引后，必须将操作结果写入 [`../context/context.txt`](../context/context.txt)。
3. **架构对齐**：完整的工作流控制与长短期记忆交互机制，请参见 [Docs 架构中心](../docs/README.md)。
