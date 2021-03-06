---
title: "A Client-side JavaScript Architecture"
subtitle: "For the Web-of-Needs Owner-Application Prototype"
author: [Renée Singer (01028092)]
tags: [some, nice, tags]
date: \today
#date: 25.01.2018

# documentclass: report
# documentclass: article
# documentclass: book
documentclass: scrbook
book: true
papersize: a4

listings: true # so pandoc-crossref works with --listings, that is required by eisvogel

# `codeBlockCaptions` allows more naturally placed code-block captions that can contain markdown on their own
# see https://github.com/lierdakil/pandoc-crossref/blob/master/docs/index.md#table-style-captions for details
#codeBlockCaptions: true
#code-block-captions: true

titlepage: true
titlepage-color: "06386E"
titlepage-text-color: "FFFFFF"
titlepage-rule-color: "FFFFFF"
titlepage-rule-height: 1

# include table-of-contents
toc: true
# include list-of-figures
lof: true
# include list-of-tables
# lot: true

#date: 2017-02-20
#subject: "Markdown"

bibliography: references.json
# citation-style: ./templates/chicago-17-author-date.csl
citation-style: ./templates/ieee-modified.csl
link-citations: true
---

<!--
no pandoc/markdown option for list of listings, so it is inlined here
see https://github.com/jgm/pandoc/issues/1728 for more details
 -->

\lstlistoflistings

\raggedbottom