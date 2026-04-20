# LaTeX 基础与模板使用指南

本模板严格遵循常州工学院格式规范。

## 1. 编译流程原理
LaTeX 采用标记语言进行排版。我们的编译流程通常是：
`XeLaTeX -> BibTeX -> XeLaTeX -> XeLaTeX`
这一套流程能确保目录、图表交叉引用、参考文献全部正确生成。

## 2. 核心文件说明
- `report.tex`：这是你主要编写论文的地方，所有的章节都在这里。
- `report.bib`：这是你的参考文献数据库，使用 BibTeX 格式。

## 3. 本地工作流 (针对高级用户)

如果你不想使用 Overleaf，推荐使用 **TeX Live + VS Code** 的现代化本地工作流。

### 3.1 环境安装 (TeX Live)

**针对大多数 Windows 用户的保姆级安装指南：**
由于 TeX Live 完整版高达数 GB，直接从官网下载极易中断。请**严格按照以下步骤**操作：

1. **下载国内镜像 (ISO 文件)**：
   - 打开清华大学开源软件镜像站：[TUNA TeX Live 镜像](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/)
   - 找到并点击下载 `texlive.iso` (通常在 4GB-5GB 左右)。
2. **挂载/解压 ISO**：
   - **Win10/Win11**：下载完成后，**双击**该 `.iso` 文件，系统会自动将其“挂载”为一个虚拟光驱（例如显示为 `DVD 驱动器 (E:)`）。
   - *(注：切勿使用解压软件去解压它，这会导致安装过程变慢且容易出错。)*
3. **启动安装程序**：
   - 进入刚才挂载的虚拟光驱，找到并**右键点击** `install-tl-windows.bat`，选择**“以管理员身份运行”**。
   - 这时会弹出一个黑色的命令行窗口以及一个图形化安装界面。
4. **图形化界面配置 (避坑点)**：
   - 点击左下角的 **"Advanced" (高级)** 按钮。
   - **修改安装路径 (可选但推荐)**：在 "TEXDIR" 处，你可以将路径从默认的 `C:\texlive\2024` 改为非系统盘，如 `D:\texlive\2024`。(⚠️ **路径中绝对不能出现中文或空格！**)
   - **精简安装 (选做)**：点击 "Collections"，可以取消勾选不需要的语言包（如俄语、阿拉伯语等），保留中文 (Chinese) 和英文即可，能节省几GB空间。
   - 点击右下角的 **"安装"** 按钮。
5. **漫长的等待**：
   - 安装过程需要解压数千个小包，通常需要 20-40 分钟，在此期间**请勿关闭任何窗口**。
   - 看到 "Welcome to TeX Live!" 提示即表示安装成功。最后，在“此电脑”中找到刚才的虚拟光驱，右键选择“弹出”即可。

**对于 macOS 和 Linux 用户：**
- **macOS**: 打开终端执行 `brew install --cask mactex-no-gui` 即可一键安装。
- **Ubuntu/Linux**: 打开终端执行 `sudo apt install texlive-full`。

### 3.2 VS Code 扩展与配置 (Windows 保姆级)

1. **安装核心扩展**：
   - 打开 VS Code，点击左侧边栏的“扩展”图标（或直接按下 `Ctrl+Shift+X`）。
   - 在搜索框中输入 `LaTeX Workshop`，找到对应插件（作者通常为 James Yu），点击**“安装”**。
2. **打开设置文件 (settings.json)**：
   - 按下 `Ctrl+Shift+P` 打开顶部命令面板。
   - 输入 `Open Settings (JSON)`，在下拉列表中点击选择 **“首选项：打开用户设置 (JSON)”** (Preferences: Open User Settings (JSON))。
3. **粘贴配置代码**：
   - 在打开的 `settings.json` 文件中，将以下代码复制，并**追加**到最外层的大括号 `{}` 内部。
   - *(⚠️ 注意：如果你的 settings 里面已经有其他配置，请确保在上一条配置的末尾加上逗号 `,` )*

```json
{
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatex -> bibtex -> xelatex*2",
            "tools": ["xelatex", "bibtex", "xelatex", "xelatex"]
        }
    ],
    "latex-workshop.latex.tools": [
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": ["-synctex=1", "-interaction=nonstopmode", "-file-line-error", "%DOC%"]
        },
        {
            "name": "bibtex",
            "command": "bibtex",
            "args": ["%DOCFILE%"]
        }
    ],
    "latex-workshop.latex.autoBuild.run": "never"
}
```

### 3.3 快捷键配置 (沉浸式手动编译)

为了防止电脑在每次打字时都疯狂自动编译导致卡顿，我们在上一步已经关闭了自动编译。现在我们需要配置 `Ctrl+S` 来手动触发编译过程。

1. **打开快捷键设置文件**：
   - 再次按下 `Ctrl+Shift+P` 打开顶部命令面板。
   - 输入 `Open Keyboard Shortcuts (JSON)`，点击选择 **“首选项：打开键盘快捷方式 (JSON)”**。
2. **粘贴快捷键代码**：
   - 将以下代码复制并粘贴到文件内的中括号 `[]` 内部（如果文件原本是空的只有 `[]`，则直接完全替换整个文件内容即可）：

```json
[
    {
        "key": "ctrl+s",
        "command": "latex-workshop.build",
        "when": "editorLangId == 'latex'"
    }
]
```
*(注：如果你是 macOS 用户，请将上述代码中的 `ctrl+s` 替换为 `cmd+s`)*

### 3.4 脚本一键编译
我们也在 `scripts/` 目录下提供了跨平台的自动化构建脚本，双击或在终端执行即可自动完成 `xelatex -> bibtex -> xelatex*2` 的完整编译链路：
- **Windows**: 双击运行 `scripts/build.bat`
- **macOS/Linux**: 在终端执行 `./scripts/build.sh`
