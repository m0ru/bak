#!/bin/bash
# Copyright (C) 2014-2016 by Thomas Auzinger <thomas@auzinger.name>

# Replace the 'x' in the next line with the name of the thesis' main LaTeX document without the '.tex' extension
#SOURCE="$1"

for arg in "$@"
do
    echo "got arg: $arg"

    case $arg in
    -w|--watch)
    watch=true
    ;;
    *)
    source="$arg"
            # unknown option
    ;;
esac
shift # past argument or value
done

function buildLatex {
  echo "\n\n\n------ (RE)BUILDING pdflatex -------\n\n\n"
  pdflatex -interaction=nonstopmode $source
}
# Build the thesis document
#buildLatex="echo '\n\n\n------ (RE)BUILDING non-bibtex/non-index -------\n\n\n' && pdflatex -interaction=nonstopmode $source"
buildLatex

echo "\n\n\n------ (RE)BUILDING bibtex -------\n\n\n"
bibtex   $source

buildLatex
buildLatex

echo "\n\n\n------ (RE)BUILDING indices -------\n\n\n"
makeindex -t $source.glg -s $source.ist -o $source.gls $source.glo
makeindex -t $source.alg -s $source.ist -o $source.acr $source.acn
makeindex -t $source.ilg -o $source.ind $source.idx

buildLatex
#$buildLatex

if [[ "$watch" = true ]]; then
echo "\n\n\n------ STARTING WATCH -------\n\n\n"
  while inotifywait -e close_write *.tex;
  do
    # build every time a tex file changes
    buildLatex
  done
else
  # build one last time
  buildLatex
  echo "Thesis document compiled."
fi
sleep
