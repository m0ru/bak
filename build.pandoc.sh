# pandoc 00_frontmatter.md 01_abstract.md 02_problemdescription.md -o export.tex && pandoc export.tex -o export.pdf
# cat 00_frontmatter.md 01_abstract.md 02_problemdescription.md | pandoc -t latex | pandoc -f latex -o export.pdf
pandoc 00_frontmatter.md 01_abstract.md 02_problemdescription.md 02a_state_of_the_art.md --pdf-engine=xelatex -o export.pdf