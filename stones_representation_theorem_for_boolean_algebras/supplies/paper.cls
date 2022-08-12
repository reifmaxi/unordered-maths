\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}[2022/07/10 My personal LaTeX class for papers.]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

\LoadClass{scrartcl}

% Manages culturally-determined typographical (and other) rules for a wide range
% of languages.
\RequirePackage{polyglossia}
\setdefaultlanguage{english}

% A reimplementation of the bibliographic facilities provided by LaTeX with
% unicode support.
\RequirePackage[style=alphabetic,sorting=nty]{biblatex}

% Provides an automatic and unified interface to AAT and OpenType fonts running
% on LuaTeX and XeLaTex engine.
\RequirePackage{fontspec}
% Font selection.
\setmainfont{Latin Modern Roman}[SmallCapsFont={Latin Modern Roman Caps}]
\setsansfont{Latin Modern Sans}
\setmonofont{Latin Modern Mono}

% Style of headings.
\setkomafont{title}{\bfseries\scshape\rmfamily}
\setkomafont{section}{\Large\bfseries\rmfamily}
\setkomafont{subsection}{\bfseries\rmfamily}

% Appearance of the table of contents.
\setkomafont{sectionentry}{\bfseries\rmfamily}
\KOMAoptions{sectionentrydots=true}
\setkomafont{sectionentrydots}{\rmfamily}

% Provides a key-value interface for optional arguments to the \includegraphics
% command.
\usepackage{graphicx}
\graphicspath{{graphics/}}

% Provides advanced facilities for inline and display quotations.
\RequirePackage{csquotes}

% Enhances the quality of tables.
\RequirePackage{booktabs}

% Provides user control over the layout of the three basic list environments:
% enumerate, itemize and description.
\RequirePackage{enumitem}
% Custom list styles.
\newlist{enumalph}{enumerate}{1}
\setlist[enumalph,1]{label=(\alph{enumalphi})}
\newlist{enumroman}{enumerate}{1}
\setlist[enumroman,1]{label=(\roman{enumromani})}

% Provides an \uline (underline) command which will break over line ends.
\RequirePackage[normalem]{ulem}
\renewcommand{\ULdepth}{1.6pt}

% Generates a coloured contour around a given text in order to enable printing
% text over a background without the need of a coloured box around the text.
\RequirePackage{contour}
\contourlength{0.8pt}

% A fancy underline command that regards possible descenders of letters.
\newcommand{\myul}[1]{%
  \uline{\phantom{#1}}%
  \llap{\contour{white}{#1}}%
}

% Provides miscellaneous enhancements for improving the information structure
% and printed output of documents that contain mathematical formulas.
\RequirePackage{amsmath}

% Providea a complete implementation of unicode maths for XeLaTeX and LuaLaTeX.
\RequirePackage{unicode-math}
\unimathsetup{math-style=TeX}
\setmathfont{Latin Modern Math}
\setmathfont{TeX Gyre Pagella Math}[range=bb]
\setmathfont{XITS Math}[range=\setminus]

% Facilitates the kind of theorem setup typically needed in American
% Mathematical Society publications.
\RequirePackage{amsthm}
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem*{corollary}{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\newtheorem{examples}[theorem]{Examples}
\newtheorem*{remark}{Remark}
\newtheorem*{notation}{Notation}
\newtheorem*{summary}{Summary}
\newtheorem*{convention}{Convention}
\renewcommand{\qedsymbol}{\ensuremath{\QED}}

% Handles cross-referencing commands in LaTeX to produce hypertext links in the
% document.
\RequirePackage[unicode,linktoc=page]{hyperref}
