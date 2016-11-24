# taken from http://tex.stackexchange.com/questions/1551/use-latex-to-produce-epub
# the alternative is to use pandoc, but that drops references

latexml --dest=$1.xml $1.tex
latexmlpost -dest=$1.html $1.xml
ebook-convert $1.html $1.epub --language en --no-default-epub-cover
