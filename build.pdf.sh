# pandoc-crossref
# - releases: https://github.com/lierdakil/pandoc-crossref/releases
# - doku: https://lierdakil.github.io/pandoc-crossref/

# as WATCH-TASK:
# entr (http://entrproject.org/)
# ls *.md | entr ./build.pdf.sh 

# NOTE: pandoc-citeproc needs to happen *after* pandoc-crossref, as they
# share the same syntax.

mkdir -p generated

pandoc \
00_frontmatter.md \
01_abstract.md \
02_problemdescription.md \
02a_state_of_the_art.md \
04_solution.md \
05_critical-reflection.md \
06_summary_and_future_work.md \
99_references_header.md \
--pdf-engine=xelatex \
--template ./templates/eisvogel-book.latex \
--csl=./templates/chicago-17-author-date.csl \
--filter ./templates/pandoc-crossref \
--filter pandoc-citeproc \
--number-sections \
--listings \
--toc \
-s \
-o generated/export.pdf \
&& echo "Finished build. Result: generated/export.pdf"
#03_methods.md \
#03_01_hevner.md \
# --filter ./pandoc-reference-filter/internalreferences.py \
