# Markdown Test Area {#sec:mdtest}

<!-- TODO -- abstract/introduction here %TODO -->

<!--

codeBlockCaptions for code-block refs?

autoSectionLabels, default false: Automatically prefix all section labels with sec:. Note that this messes with pandoc's automatic header references.

lstPrefix, default lst., lsts.: Prefix for references to lists, e.g. lsts. 2,5
-->

See [@sec:intro]. Should be same as section [-@sec:intro].

Now look again \ref{fig:thing}

web-resource test: -@ResourceDescriptionFramework2018 asdf @Webofneeds

![some caption](./figures/mvc.png){#fig:thing}

[RDF]: https://en.wikipedia.org/wiki/Resource_Description_Framework)


See RDF^[<https://en.wikipedia.org/wiki/Resource_Description_Framework> (accessed 2018/06/18)]





``` {#fig:somecode .js}
console.log("hello world");
```

see code \ref{fig:somecode}

or see \ref{fig:somecode2}

# Introduction {#sec:intro}
