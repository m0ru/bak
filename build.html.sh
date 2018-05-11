


# see build.pandoc.sh for dependencies

# pandoc 00_frontmatter.md 01_abstract.md 02_problemdescription.md -o export.tex && pandoc export.tex -o export.pdf
# cat 00_frontmatter.md 01_abstract.md 02_problemdescription.md | pandoc -t latex | pandoc -f latex -o export.pdf
pandoc \
00_frontmatter.md \
01_abstract.md \
02_problemdescription.md \
02a_state_of_the_art.md \
03_methods.md \
03_01_hevner.md \
04_solution.md \
05_guidelines.md \
06_summary_and_future_work.md \
--template ./templates/html-oida.html \
--filter ./templates/pandoc-crossref \
--number-sections \
--listings \
-s \
-o export.html
# --filter ./pandoc-reference-filter/internalreferences.py \