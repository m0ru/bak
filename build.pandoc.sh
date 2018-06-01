# eisvogel theme: https://github.com/Wandmalfarbe/pandoc-latex-template
# run sudo apt install texlive-fonts-extra first
# needed installs: 
# eisvogel (and run it's example build.sh to get eisvogel-book.latex)
# pandoc
# texlive
# texlive-xetex
# texlive-fonts-extra (for the eisvogel theme)
# texlive-math-extra
# texlive-xetex(?) or pdflatex/texlive
# librsvg2-2, librsvg2-bin (when including svg/pdf-images) + inkscape(?)
# pandoc-crossref via pacman or https://github.com/lierdakil/pandoc-crossref/releases


# pandoc-crossref
# - releases: https://github.com/lierdakil/pandoc-crossref/releases
# - doku: https://lierdakil.github.io/pandoc-crossref/

# python-pandocfilters (for use with internalreferences)
# python-pip + `pip install pandocfilters pandoc-attributes`

# eisvogel-theme seems to have problems with chapters, even when using `--top-level-division=chapter` and a documenttype of book/scrbook

# as WATCH-TASK:
# entr (http://entrproject.org/)
# ls *.md | entr ./build.pandoc.sh 


# pandoc 00_frontmatter.md 01_abstract.md 02_problemdescription.md -o export.tex && pandoc export.tex -o export.pdf
# cat 00_frontmatter.md 01_abstract.md 02_problemdescription.md | pandoc -t latex | pandoc -f latex -o export.pdf

# NOTE: pandoc-citeproc needs to happen *after* pandoc-crossref, as they
# share the same syntax.

mkdir -p generated

pandoc \
00_frontmatter.md \
01_abstract.md \
02_problemdescription.md \
02a_state_of_the_art.md \
03_methods.md \
03_01_hevner.md \
04_solution.md \
06_summary_and_future_work.md \
99_references_header.md \
--pdf-engine=xelatex \
--template ./templates/eisvogel-book.latex \
--filter ./templates/pandoc-crossref \
--filter pandoc-citeproc \
--number-sections \
--listings \
--toc \
-s \
-o generated/export.pdf
# --filter ./pandoc-reference-filter/internalreferences.py \