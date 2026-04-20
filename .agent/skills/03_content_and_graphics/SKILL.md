---
name: 03_content_and_graphics
description: 论文逻辑骨架、内容扩写与图表生成标准作业程序
---

# 论文内容构建与图表处理 SOP

本模块涵盖论文逻辑框架搭建、基于 AI 的内容扩写，以及使用 Figma 进行学术图表绘制的工程化流水线，旨在解决“AI 味重、逻辑空洞、排版杂乱”等痛点。

## 1. 逻辑骨架搭建 (金字塔原理)
论文的任何一个章节或段落，必须严格遵循**金字塔原理**构建逻辑闭环。

- **结论先行**：段落首句必须是核心观点（Top-Down 结构），避免长篇大论才见结论。
- **MECE 原则**：论据之间须“相互独立，完全穷尽”。
- **三种论证逻辑**：
  - **演绎关系**：背景/动机 -> 现有不足 -> 本文方法 -> 结论证明。
  - **归纳关系**：案例A + 数据B + 现象C 共同印证结论D。
  - **时间顺序**：第一阶段 -> 第二阶段 -> 第三阶段（适合文献综述脉络）。

## 2. 内容扩写与反“AI 味”指南 (核心 Prompt 模板)
严禁让 AI 无脑“直接扩写”，必须通过**“补充输入 + 风格锚定”**来保证信息密度。每次进行单一段落扩写时，**必须**完整附带以下高成功率 Prompt（它能极大提升文字自然顺畅感，避免 AI 常见的机器味和刻板分点）：

> **在撰写/扩写过程中，请严格遵守以下指令：**
> 1. **规范与语体**：严格遵循科学文献的写作规范，语言正式、结构严谨，避免使用口语化表达。禁止使用常见AI套话（如`首先、其次、最后、综上所述、显而易见`）。
> 2. **信息密度**：每一部分内容需包含详细的描述、必要的背景信息和逻辑完整的句子，确保表述清晰且准确。
> 3. **图表建议**：如果需要使用图片或补充信息（例如图表或实验数据），请明确建议以补充报告的完整性。
> 4. **语言要求**：全文采用中文撰写，表述应严格符合学术规范。
> 5. **排版格式 (极度重要)**：**内容不可分点展开**，但需以明确的二级/三级标题区分。每个小标题下的内容应详尽全面，**坚决避免**仅写简单的短句或大纲。
> 6. **多样性 (Perplexity)**：文本应具备较高的复杂程度，使用丰富多变的词汇，体现内容的多样性和深度。
> 7. **节奏感 (Burstiness)**：句式和句长应交替变换，兼顾长句的逻辑性与短句的简洁性，使内容生动且富有层次感。请展现高多样性与高节奏感的写作风格。

- **扩写操作流**：`确定缺漏信息 -> 收集数据/文献作为补充输入 -> 附加以上 Prompt 进行扩展`。

## 3. 学术图表生成
学术论文要求图表具备高清晰度和统一审美，**坚决抵制直接截图**。
- **质量优先级**：`自己代码绘图(如Python) > AI+Figma重绘 > 截取原图`

### 3.1 Python 学术绘图 SOP (最优路径)
适用于：数据对比图、实验结果图、统计分析图等一切**可由数据驱动**的图表。

- **工具栈**：`matplotlib` + `seaborn`(统计图) + `pandas`(数据预处理)
- **图表类型决策**：

| 数据场景 | 推荐图表 | 核心 API |
|---|---|---|
| 趋势/时序变化 | 折线图 | `plt.plot()` |
| 分类对比 | 柱状图 | `plt.bar()` / `sns.barplot()` |
| 分布/离群值 | 箱线图 | `sns.boxplot()` |
| 变量相关性 | 热力图 | `sns.heatmap()` |
| 多维聚类 | 散点图 | `plt.scatter()` |

- **国内学位论文风格模板** (每次绘图前强制执行)：
  - 国内规范：中文宋体(正文)/黑体(标题)，英文/数字 Times New Roman，字号小四(10.5pt)
  - 跨平台策略：字体优先级链自动匹配，Windows 命中 SimSun/SimHei，macOS 命中 STSong/STHeiti，无需手动装字体
```python
import matplotlib.pyplot as plt

plt.rcParams.update({
    # --- 字体：优先级链 (Win→Mac→Linux 自动匹配) ---
    'font.family': 'serif',
    'font.serif': ['SimSun', 'STSong', 'Songti SC', 'Times New Roman'],
    'font.sans-serif': ['SimHei', 'STHeiti', 'Heiti SC', 'PingFang SC'],
    'mathtext.fontset': 'stix',  # 数学公式与 Times New Roman 视觉一致
    'axes.unicode_minus': False,  # 负号显示修复 (必须)
    # --- 尺寸：对标国内学位论文 ---
    'font.size': 10.5,       # 小四号
    'axes.labelsize': 12,    # 轴标签
    'axes.titlesize': 14,    # 图标题
    'legend.fontsize': 10,
    'figure.figsize': (8, 5),
    'figure.dpi': 300,
    # --- 学术审美 ---
    'axes.spines.top': False,
    'axes.spines.right': False,
})
```
  - **⚠️ 翻车急救**：若中文仍显示方块，执行以下清缓存后重启 Python：
```python
import matplotlib; print(matplotlib.get_cachedir())
# 删除该目录下 fontlist-*.json，然后重启
```
- **输出规范**：
  - 格式：优先 PDF (矢量)，次选 PNG (dpi≥300)
  - 命令：`plt.savefig('figures/实验结果_对比.pdf', bbox_inches='tight', dpi=300)`
  - LaTeX 数学标注：标题/轴标签中使用 `$...$` 嵌入公式
- **无头环境兼容** (CI/远程服务器)：
```python
import os, matplotlib
if 'DISPLAY' not in os.environ:
    matplotlib.use('Agg')
```
- **过程快照策略**：对动态/迭代实验，在关键阶段调用 `plt.savefig()` 记录中间状态，用于报告中展示算法演进过程。
- **操作流**：`准备数据(pandas) -> 套用风格模板 -> 选择图表类型 -> 添加标注/图例 -> savefig到figures/`

### 3.2 矢量图表重绘 SOP (AI + Figma)
适用于：架构图、流程图、概念模型等**逻辑驱动**的非数据图表。

- **Figma 矢量制图 SOP**:
  1. **逻辑建模**：使用 AI (PlantUML 等语法) 梳理出严密的图表逻辑。
  2. **生成 SVG**：要求 AI 输出包含 `<g>`(分组) 和 `<text>`(文字) 标签的标准 SVG 源码。
  3. **Figma 渲染**：将 SVG 代码直接 `Cmd+V` 贴入 Figma。
  4. **二次加工**：
     - 彻底解组 (`Cmd + Shift + G` 多次) 分离文字与形状。
     - 使用自动布局 (`Shift + A`) 适应文本修改。
     - 等比缩放 (`K` 键)，并统一线条 (Stroke) 和填充色 (Fill) 符合学术审美。
  5. **导出存档**：导出高质量 PDF 或 PNG (2x以上) 放入 `figures/`。
