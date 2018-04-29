# eisvogel theme: https://github.com/Wandmalfarbe/pandoc-latex-template
# run sudo apt install texlive-fonts-extra first
# needed installs: 
# eisvogel (and run it's example build.sh to get eisvogel-book.latex)
# texlive
# texlive-fonts-extra (for the eisvogel theme)
# xetex(?) or pdflatex/texlive
# librsvg2-2, librsvg2-bin (when including svg/pdf-images) + inkscape(?)
# python-pandocfilters (for use with internalreferences)
# python-pip + `pip install pandocfilters pandoc-attributes`

# eisvogel-theme seems to have problems with chapters, even when using `--top-level-division=chapter` and a documenttype of book/scrbook

# pandoc 00_frontmatter.md 01_abstract.md 02_problemdescription.md -o export.tex && pandoc export.tex -o export.pdf
# cat 00_frontmatter.md 01_abstract.md 02_problemdescription.md | pandoc -t latex | pandoc -f latex -o export.pdf
pandoc \
00_frontmatter.md \
01_abstract.md \
02_problemdescription.md \
02a_state_of_the_art.md \
--template ./templates/html-oida.html \
--number-sections \
--listings \
-s \
-o export.html
# --filter ./pandoc-reference-filter/internalreferences.py \