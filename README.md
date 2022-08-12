# Unordered Maths

This repository consists of several folders,
each of which contains the LaTeX code of a mathematics-related paper.

Usually I'm using [LuaTeX](https://luatex.org/)
and [latexmk](https://www.ctan.org/pkg/latexmk/)
(both included in TeX Live and MiKTeX)
to build my documents;
see [below](#further-insights) for the details.
Links to the compiled files can be found under
[Get the documents](#get-the-documents).

For copyright reasons, I am not allowed to upload my university's logo.
This means:

:exclamation:
**To avoid compilation errors,
make the `\includegraphics` in `paper/supplies/titlepage.tex` a comment
or add some `paper/graphics/logo.png`!**

## Get the documents

Nothing to see here.

## Further insights

### The structure of the project folders

In most cases I spread the LaTeX code is spread over several files
to keep the individual parts clear and tidy.
The file/folder structure that has worked best for me is as follows:
```
<some_paper>
├── latexmkrc
├── main.tex
├── sections
│   ├── 01-first.tex
│   ├── 02-second.tex
│   └── ...
├── graphics
│   ├── logo.png
│   └── ...
└── supplies
    ├── literature.bib
    ├── paper.cls
    ├── shortcuts.sty
    └── titlepage.tex
```

The main file for compiling is `main.tex`.
The title page `supplies/titlepage.tex` and the actual content `sections/*`
are included in this file via LaTeX `\input` macro.

All used graphics can be found in `graphics/`;
the compiler is told about this fact by `\graphicspath{{graphics/}}`.

In addition, `supplies/` contains a custom LaTeX class `paper.cls`
and a custom LaTaX package `shortcuts.sty`.
In this way, the preamble of the main file is minimized
and code parts can be easily reused.
Make sure to add `./supplies/` to `TEXINPUTS` environment variable
before compilation (for example by the last line in `latexmkrc`).

Finally, `latexmkrc` specifies the main file
and which TeX engine should be used for compiling the document.
See more details about latexmk just below.

### latexmk

Latexmk completely automates the process of compiling a LaTeX document.
For this to work there is
- a [user's configuration file](https://github.com/reifmaxi/dotfiles/blob/main/config/latexmk/latexmkrc)
(`$XDG_CONFIG_HOME/latexmk/latexmkrc` or `~/.latexmkrc`),
- and an individual configuration file in the root directory of the project
complementing (and possilby overriding) the first one.

If set up correctly, compilation is done by simply running `latexmk`
in the root directory of the paper.

Moreover, `latexmk -pvc` continuously monitors for changes
in the relevant source files and executes a re-compilation if necessary.
This is most beneficial in combination with a PDF viewer
that reloads in case of changes on the file currently being displayed.

The complete latexmk documentation can be found [here](https://man.cx/latexmk).

### LuaTeX

My documents are written in LuaLaTeX,
a LaTeX variant for the LuaTeX engine.
This has the following advantages:
- native Unicode support, hence no need for [inputenc](https://www.ctan.org/pkg/inputenc)
- support for AAT and OpenType fonts via [fontspec](https://www.ctan.org/pkg/fontspec)
- support for Unicode mathematical typesetting via [unicode-math](https://www.ctan.org/pkg/unicode-math)
- possibility to use the [Lua programming language](https://www.lua.org/) for more complex issues

As a matter of consequence,
I use [slightly different macros](https://ctan.space-pro.be/tex-archive/macros/unicodetex/latex/unicode-math/unimath-symbols.pdf)
for mathematical symbols from time to time.

## License

The content of this project itself is licensed under the
[Creative Commons Attribution-ShareAlike 4.0 International license](https://creativecommons.org/licenses/by-sa/4.0/),
and the underlying source code used to format and display that content
is licensed under the [MIT license](LICENSE.md).
