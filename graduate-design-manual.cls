%% ----------------------------------------------------------------------
%% 常州工学院毕业设计说明书（论文）LaTeX 模版
%% 依据《计算机信息工程学院毕业设计说明书（论文）格式规范》定制
%% ----------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{graduate-design-manual}[2026/01/15 v1.4 CZU Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[UTF8, fontset=none, 12pt, a4paper, twoside]{ctexart}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{subcaption}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath, amssymb, mathtools}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[labelfont=bf,justification=centering]{caption}
\RequirePackage{tabularx, booktabs, longtable, multirow}
\RequirePackage[superscript]{cite}
\renewcommand\citeleft{【}
\renewcommand\citeright{】}
\RequirePackage[pdfusetitle, hidelinks]{hyperref}
\RequirePackage[numbers,super,square]{gbt7714}
\RequirePackage{tikz}
\usetikzlibrary{positioning}
\RequirePackage{xeCJKfntef}
\RequirePackage{chngcntr}
\RequirePackage{calc}
\RequirePackage{enumitem}
\pretocmd{\section}{\clearpage}{}{}
\renewcommand{\baselinestretch}{1.0}
% 导入代码与算法相关宏包
\RequirePackage{listings}       % 基础代码环境
\RequirePackage{algorithm}      % 算法框架
\RequirePackage{algpseudocode}  % 伪代码逻辑
\RequirePackage{newfloat}       % 用于定义新的浮动体
% 1. 字体定义
\setCJKmainfont{Simsun.ttc}[Path=fonts/, AutoFakeBold=3]
\newCJKfontfamily{\songti}{Simsun.ttc}[Path=fonts/, AutoFakeBold=3]
\newCJKfontfamily{\heiti}{SimHei.ttf}[Path=fonts/, AutoFakeBold=3]
\newCJKfontfamily{\kai}{Kaiti.ttf}[Path=fonts/]
\newCJKfontfamily{\zhongsong}{STZHONGS.ttf}[Path=fonts/, AutoFakeBold=3.17]

\setmainfont{times.ttf}[Path=fonts/, AutoFakeBold=3]
\newfontfamily{\Times}{times.ttf}[Path=fonts/, AutoFakeBold=3]
\newfontfamily{\Arial}{arial.ttf}[Path=fonts/, BoldFont=arialbd.ttf]

\xeCJKsetup{CJKglue=\hspace{0.2pt plus 0.05pt}}

%正文小四号，固定行距20pt，字间距加宽0.2pt
\renewcommand{\normalsize}{%
    \songti\fontsize{12pt}{20pt}\selectfont
    \xeCJKsetup{CJKglue=\hspace{0.2pt plus 0.05pt}} % 字间距加宽 0.2pt
}
\setlength{\parskip}{0pt}
\AtBeginEnvironment{tabular}{\fontsize{10.5pt}{14pt}\selectfont}
\AtBeginEnvironment{tabularx}{\fontsize{10.5pt}{14pt}\selectfont}
\AtBeginEnvironment{longtable}{\fontsize{10.5pt}{14pt}\selectfont}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
% 2. 版面设置
\geometry{
    a4paper,
    top=2.5cm,
    bottom=2.1cm,
    inner=2.6cm,      
    outer=2.1cm,      
    headheight=20pt,
    headsep=0.4cm,    
    footskip=0.6cm    
}

\raggedbottom

\setlist[enumerate,1]{
    label=（\arabic*）, 
    leftmargin=*, 
    itemindent=2em,
    labelsep=0em,
    align=left,
    nosep
}

\setlist[itemize,1]{
    label=\textbullet,
    leftmargin=*, 
    itemindent=2em,
    labelsep=0em,
    align=left,
    nosep
}

\setlength{\parindent}{2em}
\RequirePackage{indentfirst}
% 3. 变量定义
\newcommand*{\academy}[1]{\def\@academy{#1}}
\newcommand*{\field}[1]{\def\@field{#1}}
\newcommand*{\class}[1]{\def\@class{#1}}
\newcommand*{\classid}[1]{\def\@classid{#1}}
\newcommand*{\id}[1]{\def\@id{#1}}
\newcommand*{\Instructor}[1]{\def\@Instructor{#1}}
\newcommand*{\InstructorTitle}[1]{\def\@InstructorTitle{#1}}
\newcommand*{\ReviewingTeacher}[1]{\def\@ReviewingTeacher{#1}}
\newcommand*{\ReviewingTeacherTitle}[1]{\def\@ReviewingTeacherTitle{#1}}
\newcommand*{\thedate}[2]{\def\@Year{#1}\def\@Month{#2}}
% 4. 页眉页脚
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\fontsize{10.5pt}{12pt}\kai{计算机信息工程学院毕业设计说明书}}
\renewcommand{\headrulewidth}{0.4pt}
\fancyfoot[C]{\songti\fontsize{12pt}{20pt}\selectfont\thepage}

\fancypagestyle{abstract}{
    \fancyhf{}
    \fancyhead[C]{\fontsize{10.5pt}{12pt}\kai{计算机信息工程学院毕业设计说明书}}
    \fancyfoot{}
}
\fancypagestyle{englishabstract}{
    \fancyhf{}
    \fancyhead[C]{\fontsize{10.5pt}{12pt}\selectfont\Times Abstract}
    \fancyfoot{}
}

% 5. 标题格式
\setcounter{secnumdepth}{4} 

% 第1章：二号黑体(22pt)，居中
% 段前1.5行(30pt)，段后1行(20pt)
\titleformat{\section}[block]
    {\centering\bfseries\heiti\fontsize{22pt}{20pt}\selectfont} 
    {\leavevmode\hrule height 0pt\relax 第{\Times\arabic{section}}章}
    {1em}{}

\titlespacing*{\section}{0pt}{1.5\baselineskip}{1\baselineskip}

% 1.1：三号黑体(16pt)，左对齐
% 段前0.5行(10pt)，段后0.5行(10pt)
\titleformat{\subsection}
    {\bfseries\heiti\fontsize{16pt}{20pt}\selectfont}
    {{\Times\arabic{section}.\arabic{subsection}}}
    {1em}{}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}

% 1.1.1：四号黑体(14pt)，左对齐
% 段前0.5行(10pt)，段后0.5行(10pt)
\titleformat{\subsubsection}
    {\bfseries\heiti\fontsize{14pt}{20pt}\selectfont}
    {{\Times\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}}
    {1em}{}
\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}

% 1. (paragraph)：小四号黑体(12pt)，左对齐
% 段前0.5行(10pt)，段后0.5行(10pt)
\titleformat{\paragraph}[block]
    {\bfseries\heiti\fontsize{12pt}{20pt}\selectfont}
    {{\Times\arabic{paragraph}.}}
    {0.5em}{}
\titlespacing*{\paragraph}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titleformat{name=\section,numberless}[block]
    {\centering\bfseries\heiti\fontsize{22pt}{20pt}\selectfont} 
    {\leavevmode\hrule height 0pt\relax}
    {0pt}{}
\titlespacing*{name=\section,numberless}{0pt}{1.5\baselineskip}{1\baselineskip}
\titlespacing*{\section}{0pt}{1.5\baselineskip}{1\baselineskip}
% 6. 封面绘制辅助宏
\newcommand{\DynamicUnderline}[1]{%
    \settowidth{\@tempdima}{\strut\centering\textbf{\zhongsong\fontsize{18pt}{18pt}\selectfont #1}}%
    \node[right=1mm, anchor=north west](title) at (titleName.north east) {%
        \begin{minipage}[t][2.8cm][t]{9.4cm}
            \color{black}\zhongsong\fontsize{18pt}{45pt}\centering\selectfont #1
        \end{minipage}
    };
    \draw (title.west)++(0mm,6mm) -- +(94mm,0cm);
    \ifdim\@tempdima>9.4cm \draw (title.south west)++(0mm,1mm) -- +(94mm,0cm); \fi
}

% 7. 封面主命令
\newcommand*{\makecover}{
    \usetikzlibrary{positioning}
    \thispagestyle{empty}

    %% 使用 Tikz 构造封面
    \begin{tikzpicture}[overlay,remember picture]
        \node[shape=rectangle,draw=black,minimum width =1.6cm, minimum height = 0.65cm,below left = 1.9cm and 2.6cm] at (current page.north east) {\songti\@classid};

        \node[below=3.0cm, xshift=5mm] at (current page.north) {%
            \includegraphics[width=0.5\linewidth]{figures/cit-name.pdf}};

        \node[below=8.5cm, xshift=5mm] at (current page.north) {%
            \color{black}\centering\zhongsong\fontsize{26pt}{26pt}{\textbf{毕\hspace{0.5em}业\hspace{0.5em}设\hspace{0.5em}计\hspace{0.5em}说\hspace{0.5em}明\hspace{0.5em}书}}};

        \node[below right=11.00cm and 4.20cm](titleName) at (current page.north west) {%
            \color{black}\raggedleft\zhongsong\fontsize{18pt}{18pt}{\textbf{\hspace{36pt}题目：}}};
        \DynamicUnderline{\@title}

        \node[below left=1.25cm and 0.1cm,anchor=north east](Academy) at (title.south west) {
            \color{black}\raggedright\songti\fontsize{15pt}{33pt}{二级学院：}};
        \node[right=1mm,minimum height = 0.6cm,minimum width =9.4cm](AcademyContents) at (Academy.east){
            \color{black}\centering\songti\fontsize{15pt}{33pt}{\@academy}};
        \draw (AcademyContents.south west) -- (AcademyContents.south east);
        
        \node[below left=0.8cm and 0cm](Field) at (Academy.south east) {%
            \color{black}\raggedright\songti\fontsize{15pt}{33pt}{专\hspace{30pt}业：}};
        \node[right=0.1cm,minimum height = 0.6cm,minimum width =3.5cm](FieldContents) at (Field.east){
            \color{black}\centering\songti\fontsize{15pt}{33pt}{\@field}};
        \draw (FieldContents.south west) -- (FieldContents.south east);

        \node[below left=0.8cm and 0cm, minimum height = 0.6cm,minimum width =3.5cm](ClassContents) at (AcademyContents.south east){
            \color{black}\centering\fontsize{15pt}{33pt}\Times{\@class}};
        \draw (ClassContents.south west) -- (ClassContents.south east);
        \node[left=0.1cm](Class) at (ClassContents.west) {%
            \color{black}\raggedright\fontsize{15pt}{33pt}{班级：}};

        \node[below left=0.8cm and 0cm](Name) at (Field.south east) {%
            \color{black}\raggedleft\songti\fontsize{15pt}{33pt}{学生姓名：}};
        \node[right=0.1cm,minimum height = 0.6cm,minimum width =3.5cm](NameContents) at (Name.east){
            \color{black}\centering\fontsize{15pt}{33pt}\Times{\@author}};
        \draw (NameContents.south west) -- (NameContents.south east);

        \node[below left=0.8cm and 0cm](Id) at (Class.south east) {%
            \color{black}\raggedright\songti\fontsize{15pt}{33pt}{学号：}};
        \node[right=0.1cm,minimum height = 0.6cm,minimum width =3.5cm](IdContents) at (Id.east){
            \color{black}\centering\fontsize{15pt}{33pt}\Times{\@id}};
        \draw (IdContents.south west) -- (IdContents.south east);

        \node[below left=0.8cm and 0cm](Instructor) at (Name.south east) {%
            \color{black}\raggedright\songti\fontsize{15pt}{33pt}{指导教师：}};
        \node[right=0.1cm,minimum height = 0.6cm,minimum width =3.5cm](InstructorContents) at (Instructor.east){
            \color{black}\centering\songti\fontsize{15pt}{33pt}{\@Instructor}};
        \draw (InstructorContents.south west) -- (InstructorContents.south east);

        \node[below left=0.8cm and 0cm](InstructorTitle) at (Id.south east) {%
            \color{black}\raggedright\songti\fontsize{15pt}{33pt}{职称：}};
        \node[right=0.1cm,minimum height = 0.6cm,minimum width =3.5cm](InstructorTitleContents) at (InstructorTitle.east){
            \color{black}\centering\fontsize{15pt}{33pt}\Times{\@InstructorTitle}};
        \draw (InstructorTitleContents.south west) -- (InstructorTitleContents.south east);

        \node[below left=0.8cm and 0cm](ReviewingTeacher) at (Instructor.south east) {%
            \color{black}\raggedright\songti\fontsize{15pt}{33pt}{评阅教师：}};
        \node[right=0.1cm,minimum height = 0.6cm,minimum width =3.5cm](ReviewingTeacherContents) at (ReviewingTeacher.east){
            \color{black}\centering\songti\fontsize{15pt}{33pt}{\@ReviewingTeacher}};
        \draw (ReviewingTeacherContents.south west) -- (ReviewingTeacherContents.south east);

        \node[below left=0.8cm and 0cm](ReviewingTeacherTitle) at (InstructorTitle.south east) {%
            \color{black}\raggedright\songti\fontsize{15pt}{33pt}{职称：}};
        \node[right=0.1cm,minimum height = 0.6cm,minimum width =3.5cm](ReviewingTeacherTitleContents) at (ReviewingTeacherTitle.east){
            \color{black}\centering\fontsize{15pt}{33pt}\Times{\@ReviewingTeacherTitle}};
        \draw (ReviewingTeacherTitleContents.south west) -- (ReviewingTeacherTitleContents.south east);
        
        \node[above=3.40cm, xshift=5mm] at (current page.south) {
            \color{black}\centering\fontsize{15pt}{15pt}\Times{\@Year}\songti{年}\Times{\@Month}\songti{月}};
    \end{tikzpicture}
    \newpage
}

%前言
\newenvironment{preamble}
{
    \clearpage
    \section*{前言} 
    \thispagestyle{fancy}
    \fancyfoot[C]{\songti\fontsize{9pt}{11pt}\selectfont\thepage} 
}
{\clearpage}

%摘要
\newenvironment{cnabstract}[2]
{
    \clearpage
    \pagestyle{abstract}
    \songti\fontsize{12pt}{20pt}\selectfont
    
    {
        \centering
        {\fontsize{16pt}{20pt}\selectfont \textbf{#1}\par}
        {\bfseries 摘~~要\par}
    }
    
    \def\tempkeywords{#2} 
}
{
    \par
    \noindent\hspace{2em}{\bfseries 关键词：}\tempkeywords
    \clearpage
}

\newenvironment{englishabstract}[2] % #1: Title, #2: Key words
{
    \clearpage
    \pagestyle{englishabstract}
    \Times\fontsize{12pt}{20pt}\selectfont
    
    {
        \centering
        {\Arial\bfseries\fontsize{14pt}{20pt}\selectfont \MakeUppercase{#1}\par}
        {\Arial\bfseries\fontsize{14pt}{20pt}\selectfont ABSTRACT\par}
    }
    \def\tempekeywords{#2} 
}
{
    \par
    \noindent\hspace{2em}{\Times\fontsize{12pt}{20pt}\selectfont \textbf{Key words: }}\tempekeywords
    \clearpage
}
%目录
%1. 引入宏包
\usepackage[titles]{tocloft}

%2. 统一字体定义
\newcommand{\tocfont}{\songti\fontsize{12pt}{12pt}\selectfont}

%3. 目录标题
\renewcommand{\contentsname}{\centering\fontsize{22pt}{20pt}\selectfont\heiti 目录}

%4. 引导线疏密设置
\renewcommand{\cftsecdotsep}{1}
\renewcommand{\cftsubsecdotsep}{1}
\renewcommand{\cftsubsubsecdotsep}{1}

%5. 各级标题间距与格式设置
% 一级标题 (第1章)
\setlength{\cftbeforesecskip}{6pt} 
\renewcommand{\cftsecfont}{\tocfont\bfseries}
\renewcommand{\cftsecpagefont}{\tocfont\bfseries}
\newlength{\secwidth}
\settowidth{\secwidth}{\tocfont\bfseries 第88章\hspace{0.4em}}
\setlength{\cftsecnumwidth}{\secwidth}

% 二级标题 (1.1)
\setlength{\cftbeforesubsecskip}{6pt}
\renewcommand{\cftsubsecfont}{\tocfont}
\renewcommand{\cftsubsecpagefont}{\tocfont}
\setlength{\cftsubsecindent}{1.5em}
\setlength{\cftsubsecnumwidth}{1.8em}

% 三级标题 (1.1.1)
\setlength{\cftbeforesubsubsecskip}{6pt}
\renewcommand{\cftsubsubsecfont}{\tocfont}
\renewcommand{\cftsubsubsecpagefont}{\tocfont}
\setlength{\cftsubsubsecindent}{3em}
\setlength{\cftsubsubsecnumwidth}{2.5em}

% 目录生成命令
\newcommand{\contents}
{
    \clearpage
    \pagenumbering{Roman} 
    \setlength{\parskip}{0pt}
    \ctexset{section={name={第,章}}}
    \fancypagestyle{plain}{
        \fancyhf{}
        \fancyhead[C]{\fontsize{10.5pt}{12pt}\kai{计算机信息工程学院毕业设计说明书}}
        \fancyfoot[C]{\songti\fontsize{9pt}{11pt}\selectfont\thepage}
        \renewcommand{\headrulewidth}{0.4pt}
    }
    
    \tableofcontents
    \thispagestyle{plain} 
    \clearpage
}

\newcommand{\mainbody}
{
    \clearpage
    \pagenumbering{arabic} 
    \fancyfoot[C]{\songti\fontsize{12pt}{20pt}\selectfont\thepage} 
}

%9. 插图、表格、公式格式化

% 编号按章计：图 1-1, 表 3-1, 公式 (2.3)
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}

\renewcommand{\thefigure}{\thesection－\arabic{figure}}
\renewcommand{\thetable}{\thesection－\arabic{table}}
\renewcommand{\theequation}{\thesection.\arabic{equation}}

\DeclareCaptionFont{five}{\songti\fontsize{10.5pt}{12pt}\selectfont}
\DeclareCaptionLabelSeparator{customsep}{\hspace{1em}} % 编号与题名间空1个字距

\captionsetup{
    font=five,
    labelsep=customsep,
    justification=centering,
}

% 针对插图：图号图题在下
\captionsetup[figure]{position=bottom, skip=10pt}
% 针对表格：表号表题在上
\captionsetup[table]{position=top, skip=10pt}

% 公式括号形式
\makeatletter
\def\tagform@#1{\maketag@@@{(\ignorespaces#1\unskip\@@italiccorr)}}
\makeatother

% 10. 致谢环境
\newenvironment{acknowledgement}
{
    \clearpage
    \section*{致谢}
    \addcontentsline{toc}{section}{致谢}
    \songti\fontsize{12pt}{20pt}\selectfont 
}
{\clearpage}

% 11. 参考文献格式
\setcitestyle{open={【},close={】},citesep={,},super}

\AtBeginEnvironment{thebibliography}{
    \songti\fontsize{10.5pt}{20pt}\selectfont
    \xeCJKsetup{CJKglue=\hspace{0.2pt plus 0.05pt}}
}


% 12. 附录格式
\newenvironment{appendixsection}
{
    \clearpage
    \appendix
    % 1. 编号格式
    \renewcommand{\thesection}{\arabic{section}}
    \ctexset{section={
        name={附,},
        number={\arabic{section}}
    }}
    % 2. 标题格式
    \titleformat{\section}[block]
        {\bfseries\heiti\fontsize{16pt}{20pt}\selectfont}
        {\leavevmode\hrule height 0pt\relax 附\thesection}
        {1em}{}
        
    % 3. 间距
    \titlespacing*{\section}{0pt}{30pt}{20pt}
    
    % 4. 附录正文设置
    \songti\fontsize{12pt}{20pt}\selectfont
    \xeCJKsetup{CJKglue=\hspace{0.2pt plus 0.05pt}}
}
{\clearpage}

\DeclareFloatingEnvironment[
    fileext=lol,
    listname={代码清单},
    name={图}, 
    placement=H
]{listing}

% 设置代码编号按章排序，例如：图 3－1
\counterwithin{listing}{section}
\renewcommand{\thelisting}{\thesection－\arabic{listing}}

% 设置算法编号按章排序，例如：算法 3－1
\counterwithin{algorithm}{section}
\renewcommand{\thealgorithm}{\thesection－\arabic{algorithm}}
\floatname{algorithm}{算法}
\lstset{
    basicstyle=\fontsize{10.5pt}{14pt}\selectfont\Times,
    columns=flexible,
    breaklines=true,
    frame=single,
    rulecolor=\color{black},
    extendedchars=false,
    showstringspaces=false,
    captionpos=b,
    tabsize=4
}

\endinput