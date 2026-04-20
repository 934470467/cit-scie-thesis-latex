# 核心文档与 AI 约束库 (Docs & Vibe Coding Core)

欢迎来到文档中心！本目录包含了所有面向用户的新手教程以及面向大模型（AI）的极度约束配置，旨在实现高质量的 Vibe Coding 体验。

## 👨‍🎓 面向用户的指南

- **[LaTeX 基础与模板使用指南](latex-guide.md)**：包含本模板的核心设计、排版规范以及本地编译方法。
- **[Overleaf 新手图文教程](overleaf-tutorial.md)**：专为无编程基础的同学准备，展示如何使用云端 Overleaf 免配置完成排版。
- **[编译报错与社区资源大全](troubleshooting.md)**：汇总了常见的编译报错解决方案（如字体缺失、引用报错），并提供了优秀的社区链接。

## 🤖 面向开发者的 Vibe Coding 架构与约束

### 为什么要建立这套约束？
在依赖大模型（如 Cursor、Gemini、Claude 等 Agentic AI）进行长线项目开发时，极易面临**“上下文遗忘、胡乱重构核心代码、无法追溯历史排错思路”**的灾难性后果。
为了将毕业设计模板打造成可维护的“工业级”工程，我们引入了基于高约束的**状态追踪机制**和**技能抽离原则**。其核心目的是：
1. **记忆连续性**：通过外置持久化文件，解决 AI 记不住上个月踩过的坑的问题。
2. **安全隔离**：让给机器看的配置文件与给人类看的 LaTeX 论文完全物理隔离，绝不污染用户目录。
3. **经验工程化**：将你个人的排版经验、绘图习惯沉淀为机器可直接读取执行的规范 SOP。

### 核心 Agent 配置地图 (Navigation)
为了方便项目协作者或二次开发者管理 AI 工作流，请直接点击下方链接跳转到对应的约束中心：

#### 1. 任务最高纲领 (Task Definition)
- [`prds/prd.md`](../prds/prd.md) & [`prds/prd.json`](../prds/prd.json)：定义当前迭代的总目标和原子化拆解步骤。AI 必须以此为准星，不偏离需求。

#### 2. 短期与长期记忆库 (Memory & Context)
- [`context/context.txt`](../context/context.txt)：短期执行日志。AI 每次排错或修改后必须在此记录过程。
- [`context/memory.md`](../context/memory.md)：长期压缩记忆。当日志过长时进行归档，节省宝贵的 Token 成本。

#### 3. 专精能力模块 (Skill SOPs)
大模型在执行动作前，需强制挂载对应的“知识外挂”以保证动作不变形：
- 🛠️ [**基础设施** (`.agent/skills/01_latex_infrastructure/SKILL.md`)](../.agent/skills/01_latex_infrastructure/SKILL.md)：控制编译链条、宏包冲突规则。
- 📚 [**学术检索** (`.agent/skills/02_research_and_sourcing/SKILL.md`)](../.agent/skills/02_research_and_sourcing/SKILL.md)：定义如何查找高质量论文与数据源。
- 📊 [**内容与图表** (`.agent/skills/03_content_and_graphics/SKILL.md`)](../.agent/skills/03_content_and_graphics/SKILL.md)：反“AI味”扩写指令，及 Python/Figma 矢量图表生成标准。
- ⚙️ [**工程与编码** (`.agent/skills/04_vibe_coding_engineering/SKILL.md`)](../.agent/skills/04_vibe_coding_engineering/SKILL.md)：约束文件读写方式、目录规划等基本准则。
