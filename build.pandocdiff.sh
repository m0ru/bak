#!/bin/zsh

# requires pandiff (`npm -g pandiff`)


# sub-folder for build
# for loop over files
# pandocdiff for each
# pdftk cat the parts
# remove intermediate files


otherfolder=../bak-diffbase


files=(\
    00_frontmatter.md \
    01_abstract.md \
    02_problemdescription.md \
    02a_state_of_the_art.md \
    03_methods.md \
    03_01_hevner.md \
    04_solution.md \
    05_guidelines.md \
    06_summary_and_future_work.md \
)    

mkdir -p generated

for f in $files; 
do pandiff $otherfolder/$f $f -o generated/$f.pdf;
done
# pandocdiff \
# -o generated/export.pdf
# --filter ./pandoc-reference-filter/internalreferences.py \