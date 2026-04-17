# 常州工学院毕业设计说明书（论文）LaTeX 模板

本模板依据《常州工学院计算机信息工程学院毕业设计说明书（论文）格式规范》定制开发。

## 1. 项目简介
本模板旨在为常州工学院计算机学院的学生提供一个标准化的 LaTeX 排版环境，自动处理封面绘制、目录生成、中英文摘要、正文格式（标题间距、行距、字间距）、公式编号、参考文献引用等繁琐的排版工作。

## 2. 环境要求
* **LaTeX 编译器**: 必须使用 **XeLaTeX**（以支持 `xeCJK` 宏包和本地字体调用）。
* **参考文献工具**: BibTeX (配合 `gbt7714` 样式)。
* **操作系统**: Windows / macOS / Linux (已配置跨平台字体路径兼容)。

## 3. 编译

支持overleaf、VSCode(LaTeX Workshop)、TeXstudio、等主流工具平台外。我们也提供了基于 `make` 的命令行编译方式。

请使用 `XeLaTeX + BibTeX` 完成论文编译。

make相关命令：
```bash
# 编译命令，项目根目录只保留最终生成的 report.pdf，所有中间文件会输出到 .tmp/
make

# 删除中间过程文件
make clean

# 删除中间过程文件和最终pdf
make distclean
```

## 4. 目录结构说明
```text
.
├── graduate-design-manual.cls   # 核心类文件：定义了论文的所有格式规范
├── report.tex                   # 论文主文件 (如适用)
├── Makefile                     # make 编译入口
├── fonts/                       # 本地字体库 (必须包含，由 .cls 文件调用)
│   ├── Simsun.ttc               # 宋体
│   ├── SimHei.ttf               # 黑体
│   ├── Kaiti.ttf                # 楷体
│   ├── STZHONGS.ttf             # 华文中宋
│   ├── times.ttf                # Times New Roman
│   └── arial.ttf                # Arial
├── figures/                     # 插图文件夹
│   ├── cit-name.pdf             # 封面校名矢量图
│   └── *.png/*.pdf              # 实验结果、电路图、流程图等
└──  gbt7714/                     # 参考文献 GB/T 7714 标准样式包
```

如有更改需求，请PR提交。

> 不久将更新适合常工院毕业设计的skills。
