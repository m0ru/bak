# eisvogel theme: https://github.com/Wandmalfarbe/pandoc-latex-template
# run sudo apt install texlive-fonts-extra first
# needed installs: 
# eisvogel (and run it's example build.sh to get eisvogel-book.latex)
# texlive
# texlive-fonts-extra (for the eisvogel theme)
# xetex(?) or pdflatex/texlive
# librsvg2-2, librsvg2-bin (when including svg/pdf-images) + inkscape(?)

# eisvogel-theme seems to have problems with chapters, even when using `--top-level-division=chapter` and a documenttype of book/scrbook

# pandoc 00_frontmatter.md 01_abstract.md 02_problemdescription.md -o export.tex && pandoc export.tex -o export.pdf
# cat 00_frontmatter.md 01_abstract.md 02_problemdescription.md | pandoc -t latex | pandoc -f latex -o export.pdf
pandoc \
00_frontmatter.md \
01_abstract.md \
02_problemdescription.md \
02a_state_of_the_art.md \
--pdf-engine=xelatex \
--template ./templates/eisvogel-book.latex \
--number-sections \
--listings \
--toc \
-o export.pdf