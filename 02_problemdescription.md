
# Problem Description {#sec:probdescr}

This thesis is part of the over-arching Web of Needs^[<http://www.webofneeds.org/> (accessed 2018-06-18). Related publications: <http://sat.researchstudio.at/en/web-of-needs> (accessed 2018-06-18)] project -- short WoN --
and, somewhat more particular, of developing an end-user-friendly client-application^[<https://www.matchat.org/owner/> (accessed 2018-06-18).] prototype/demonstrator for it,
that allows testing the protocol and helps with communicating the WoN's potential to people.
The main focus of the work done for this thesis was to research ways of
structuring the JavaScript-based client-application; thus it consisted
of researching and experimenting with state-of-the-art web-application
architectures and tooling, adapting and innovating on them for the
particular problem space, as well as identifying a migration path for
updating the existing code-base. To define the requirements, we first
need to take a high-level look at what the Web of Needs is and how
people can interact with it.

<!-- problem-description\\ -->
<!-- * high-level\\ -->
<!-- * for people who aren't web-devs\\ -->
<!-- * pro problem ein satz: "prob ist im browser ld zu verwenden, dazu müssen sie geladen, geparst, gestored werden."\\ -->

<!-- Problemstellung (JS-Basisarchitektur für WoN-Owner App)\\ -->
<!-- as case study in architecture/migration\\ -->

<!--
TODO define ontologies and rdf; node = won-data/document-server
 -->

## Web of Needs {#web-of-needs}

It is a set of protocols (and reference implementations) that allow
posting documents, for instance describing supply and demand. Starkly
simplified examples would be "I have a couch to give away" or "I'd
like to travel to Paris in a week and need transportation". These
documents, called "needs" can be posted on arbitrary data servers
(called "WoN-Nodes"). There they're discovered by matching-services,
that continuously crawl the nodes they can find. Additionally, to get
results more quickly, nodes can notify matchers of new needs. These then get compared
with the ones the matcher already knows about. If it finds a good pair
-- e.g. "I have a couch to give away" and "Looking for furniture for
my living room" -- the matcher notifies the owners of these needs. They
can then decide whether they want to contact each other. If they send
and accept each other's contact request, they can start chatting with
each other. The protocol in theory can also be used as a base-level for
other interactions, like entering into contracts or transferring money.

<!-- PREVIOUSLY: It is a set of protocols (and reference implementations) that allow posting things like supply and demand (e.g. "I have a couch to give away") online on an arbitrary data server (called WoN-Node). These documents, called "needs", get discovered by a matching-service that notifies the owners of these needs (e.g. when the matcher finds someone that needs the couch offered). The protocols then allow for chatting (or other transactions) between the owners. -->

## Data on WoN-Nodes {#data-on-won-nodes}

Needs, connections between them and any events on those connections are
published on the WoN-Nodes in the form of RDF, which stands for
Resource
Description Framework^[<https://en.wikipedia.org/wiki/Resource_Description_Framework> (accessed 2018-06-18).]. In RDF, using a variety of different
syntax-alternatives, data is structured as a graph that can be
distributed over multiple (physical) resources. Every graph-edge is defined by a subject (the start-node), a predicate (the "edge-type") and object (the target-node). 

Note that the subject always needs to be an Unique Resource
Identifiers (URIs). For the case, when those URIs are also Uniform
Resource Locators (URLs) there is the convention to host that data under that URL.
This allows easily linking data graphs on multiple servers, thus making them
Linked Data^[<https://en.wikipedia.org/wiki/Linked_data> (accessed 2018-06-18).]. This is a
necessary requirement for the Web of Needs, as data is naturally spread
out across several servers, i.e. WoN-Nodes.

Some example triples taken from a need/post on the WoN-Node running at <http://node.matchat.org> (accessed 2018-06-18) could look something
like the following ones:

```{.ttl #fig:needtriples}
<https://node.matchat.org/won/resource/need/ow14asq0gqsb>
<http://purl.org/webofneeds/model#is>
_:b0 .

<https://node.matchat.org/won/resource/need/ow14asq0gqsb>
<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
<http://purl.org/webofneeds/model#Need> .

_:b0
<http://purl.org/dc/elements/1.1/title>
"Simple easel to give away" .

_:b0
<http://purl.org/dc/elements/1.1/description>
"I've got an old easel lying around at my place that is \
mostly just catching dust. If there is any aspiring landscape \
painters that would like to have it: poke me :)" .

```
<!--
Excerpt of a need description (N-Triples)}
-->

As can be seen, this way of specifying triples, called N-Triples, isn't
well-suited for direct reading or authoring; the subjects (`.../need/ow14asq0gqsb` and `_:b0`) are repeated and large parts of
the URIs are duplicate. The short URIs starting with an underscore (e.g.
`_:b0` are called blank-nodes and don't have meaning
outside of a document and can reoccur in other documents as opposed to Unique Resource Identifiers. there is also a convention that when using URLs used as subject-URIs (e.g.
<https://node.matchat.org/won/resource/need/ow14asq0gqsb>) it should be possible to access these to get a document with the triples for that subject.

There are several other markup-languages respectively serialization-formats
for easier writing and clearer serializations for these triples, e.g. Turtle/Trig, JSON-LD and the somewhat verbose RDF/XML. The same example, but in JavaScript Object Notation for Linked Data
(JSON-LD) would read as follows:

``` {#fig:needjson .json}
{
  "@id": "need:ow14asq0gqsb",
  "@type": "won:Need",
  "won:is": {
    "@id": "_:b3", // <-- optional
    "dc:title": "Simple easel to give away"
    "dc:description": "I've got an old easel lying \
    around at my place that is mostly just catching \
    dust. If there is any aspiring landscape painters \
    that would like to have it: poke me :)",
  },

  "@context": {
    "dc": "http://purl.org/dc/elements/1.1/",
    "need": "https://node.matchat.org/won/resource/need/",
    "won": "http://purl.org/webofneeds/model#"
  }
}
```

As can be seen above, JSON-LD allows to visually represent the nesting (`need:ow14asq0gqsb won:is _:b3`) and to define prefixes (in the `@context`). Together this allows to avoid redundancies. The other serialization-formats are similar in this regard (and are used between other services in the Web of Needs) -- see below for a turtle-serialization of the same triples:

``` {#fig:needttl .json}
@prefix dc:    <http://purl.org/dc/elements/1.1/> .
@prefix need:  <https://node.matchat.org/won/resource/need/> .
@prefix won:   <http://purl.org/webofneeds/model#> .

need:ow14asq0gqsb
  a             won:Need ;
  won:is        [
    dc:title         "Simple easel to give away" ;
    dc:description   "I've got an old easel lying
      around at my place that is mostly just catching
      dust. If there is any aspiring landscape painters
      that would like to have it: poke me :)"
  ]
```

However, as JSON-LD also constitutes valid JSON/JS-object-literal-syntax, it is the natural choice for using it in the JS-based client-application and was already being used in the existing code-base.

## WoN-Owner-Application {#won-owner-application}

### Interaction Design {#interaction-design}

Among the three services that play roles in the web of needs --
matchers, nodes and owner-applications -- the work at hand has its focus
on the latter of these. It provides people with a way to interact with the
other services in a similar way to how an email-client allows interacting
with email-servers. Through it, people can:

* Create and post new needs. Currently these consist of a simple data-structure with a subject line, a long textual description and optional tags or location information.
* View needs/posts and all data in them in a human-friendly fashion
* Share links to needs/posts with other people
* Immediately get notified of and see matches, incoming requests and chat messages
* Send and accept contact/connection requests
* Write and send chat messages

For exploring these interactions, several prototypes had already been designed and implemented. The first were paper-based or simple clickable dummies, that weren't fully interactive. The last prototype before the one described in this work had been implemented using Angular 1.X and its MVC-architecture ([@sec:angular-mvc]). For this iteration new graphic designs were made, that necessesitated to leave the Bootstrap-theme we had previously been using behind and develop and maintain our own (S)CSS (see [section @sec:scss]).

<!-- TODO { screens from last prototype } -->

### Technical Requirements {#sec:technical-requirements}

On the development-side of things, the requirements were:

*  The application needs to be able to keep data in sync between browser-tabs running the JS-client and the Java-based servers. This happens through a REST-API and websockets. Most messages arrive at the WoN-Owner-Server from the WoN-Node and just get forwarded to the client via the websocket. The only data directly stored on and fetched from the Owner-Server are the URIs and private keys[^cryptography happens on the WoN-Owner-Server] of needs/posts owned by an account, as well as information which messages have been seen. All other data lives on the WoN-Node-Servers, that have no concept of user-accounts.
*  As subject of a research-project, the protocols can change at any time. Doing so should only cause minimal refactoring in the owner-application.
* In the future different means of protocols will be added to connections, i.e. interactions between needs, such as payments or the recently added "agreements", i.e. a mechanism to make formalized contracts via messages exchanged over the connections by formally agreeing with the contents of other messages)
* Ultimately the interface for authoring needs should support a wide range of ontologies^[Ontologies can be described as data-structure-descriptions, i.e. schemata, for RDF-data. E.g. the current demo-ontology defines that needs can have a title, a description, a location, tags, etc.] respectively any ontology people might want to use for describing things and concepts. Adapting the authoring GUIs or even just adding a few form input widgets should be seamless and only require a few local changes.
* We^[My colleagues at the researchstudio Smart Agent Technologies and I] didn't want to deal with the additional hurdles/constraints of designing the prototype for mobile-screens at first, but a later adaption/port was to be expected. Changing the client application for that needed to require minimal effort.
* It should be possible to build an application that feels responsive when using it. This means low times till first meaningful render and complete page-load. This in term implies a reduction of round-trips and HTTP-requests and use of caching mechanisms for data and application code. But "feeling responsive" also means that operations that take a while despite all other efforts need to show feedback to the user (e.g. spinning wheels, progress bars, etc) to communicate that the application hasn't frozen.
* Runs on ever-green browsers. As it's a research-prototype there is less need to support old browsers, like the pre-edge internet-explorer.
* Good developer experience, i.e. new language features to allow more expressive, robust and concise code, warnings about possible bugs where possible, auto-completion, jump-to-definition, documentation on mouse-hover, etc.
* Any new technologies needed to be feasible to learn within the project's scope. 
* The more of the old code-base that could be kept, the better in regard to the scope.

<!-- TODO why we implemented it JS-based:\\
* bandwidth\\
* because it’s become somewhat of a wide-spread practice, i.e. “because everybody’s doing so”\\
* because there already was the Angular-prototype\\
* because it can run on any OS and device\\
status quo: Angular app\\ -->

The previous iteration of the prototype had already been implemented in
Angular-js 1.X. However, the code-base was proving hard to maintain. We
continuously had to deal with bugs that were hard to track down,
partly because JavaScript's dynamic nature obscured where they originated in
the code and mostly because causality in the Angular-app became
increasingly convoluted and hard to understand. The application's
architecture needed an overhaul to deal with these issues, which gave rise to the
work at hand. Thus, additional requirements were:

*  Causality in the application is clear and concise to make understanding the code and tracking down bugs easier.
* Local changes can't break code elsewhere, i.e. side-effects are minimized.
* Responsibilities of functions and classes are clear and separated, so that multiple developers can easily collaborate.
* The current system state is transparent and easily understandable to make understanding causality easier.
* The solution should lessen the problems that JavaScript's weakly-typed nature causes, e.g. bugs causing errors way later in the program-flow instead of at the line where the problem lies.
* Reduces code-redundancies
* Makes code conciser and clearer to the reader

<!--  TODO image: dependency graph in Angular-application. slide from FB’s flux presentation?-->
<!-- TODO go through old application and do this empirically for a few components and bugs?\\
-->
