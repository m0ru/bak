
mkdir -p generated

pandoc \
00_frontmatter.md \
01_abstract.md \
02_problemdescription.md \
02a_state_of_the_art.md \
04_solution.md \
99_references_header.md \
--csl=./templates/chicago-17-author-date.csl \
--filter ./templates/pandoc-crossref \
--filter pandoc-citeproc \
--number-sections \
--listings \
--toc \
-s \
-o generated/export.odt
# 03_methods.md \
# 03_01_hevner.md \
# 05_critical-reflection.md \
# 06_summary_and_future_work.md \