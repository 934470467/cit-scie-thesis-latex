# 编译排错与社区资源大全

如果你在编译过程中遇到了问题，请不要慌张。以下是常见的错误排查清单和解决方案。

## 常见报错指南

### 1. 找不到字体 (Font NotFound)
- **原因**：本地或云端缺少模板要求的 `.ttf` 或 `.ttc` 字体。
- **解决**：确保 `fonts/` 目录完整。Overleaf 上不需要安装，因为模板会自动从同级目录加载。如果是本地环境，请确保使用的是 `XeLaTeX` 编译器。

### 2. 交叉引用或目录是问号 `??`
- **原因**：只编译了一次。LaTeX 需要多次编译才能解析所有链接。
- **解决**：请完整执行 `XeLaTeX -> BibTeX -> XeLaTeX -> XeLaTeX`。如果你使用我们提供的 `scripts/`，它已经帮你自动执行完毕。

### 3. 参考文献未显示
- **原因**：未执行 BibTeX 或 BibTeX 执行失败。
- **解决**：检查 `report.bib` 格式是否有语法错误。确保 `\cite{}` 引用了真实存在的文献标签。

## 外部社区支持
AI 助手（Agent）在遇到难以解决的宏包冲突时，可以查阅以下社区资源：
- **[CTAN (The Comprehensive TeX Archive Network)](https://ctan.org/)**：查询所有宏包的官方文档。
- **[TeX StackExchange](https://tex.stackexchange.com/)**：全球最大的 LaTeX 问答社区。
- **[Overleaf Documentation](https://www.overleaf.com/learn)**：极好的基础教程和问题排查指引。
