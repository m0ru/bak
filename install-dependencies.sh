
# eisvogel theme: https://github.com/Wandmalfarbe/pandoc-latex-template
# eisvogel (and run it's example build.sh to get eisvogel-book.latex)
# texlive-fonts-extra (for the eisvogel theme)
# texlive-xetex(?) or pdflatex/texlive
# librsvg2-2, librsvg2-bin (when including svg/pdf-images) + inkscape(?)
# pandoc-crossref via pacman or https://github.com/lierdakil/pandoc-crossref/releases

sudo apt install \
texlive \
texlive-xetex \
texlive-fonts-extra \
texlive-math-extra \
librsvg2-2 \
librsvg2-bin


echo ""
echo "-------------"
echo ""
echo "IMPORTANT:"
echo ""
echo "If you're on ubuntu, you'll need to manually get a pandoc 2.1 or newer from here https://pandoc.org/installing.html#linux"
echo ""
echo "You'll also need to manually install pandoc-crossref from https://github.com/lierdakil/pandoc-crossref/releases"