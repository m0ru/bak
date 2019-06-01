# Authorship Declaration

Hereby I declare, that I authored this work on my own and that all sources and aids have been listed in their entirety and that all parts of the work -- including tables, maps and figures -- stemming from other works in exact wording or spirit, have been marked as quote and contain a reference to the source.

<!--
TODO Vienna,

Ort, Datum, Unterschrift
-->

# Abstract {#sec:abstract}

<!--

take important point from other section

intro sentence from 02_..

check tuwien outline?

* Kontext der Arbeit / Aufgabenstellung
* Fragestellung der Diplomarbeit
* Wissenschaftliche  Methode(n)  /  Verfahrensweise(n),  mit  deren  Hilfe  die  Ergebnisse  erzielt  
* wurden
* Zentrale Ergebnisse der Arbeit

-->

This thesis is part of the over-arching Web of Needs^[See: <http://www.webofneeds.org/>. For WoN-related publications see: <https://sat.researchstudio.at/en/web-of-needs>] project -- short WoN --
and, somewhat more particular, of developing an end-user-friendly client-application [@Match] prototype/demonstrator for it,
that allows testing the protocol and helps with communicating the WoN's potential to people.
The main focus of the work done for this thesis was to research ways of
structuring the JavaScript-based client-application; thus it consisted
of researching and experimenting with state-of-the-art web-application
architectures and tooling, adapting and innovating on them for the
particular problem space laid out in [chapter @sec:probdescr], as well as identifying a migration path for
updating the existing code-base.

As laid out in [chapter @sec:suggested-solution], we used a variant of the (ng-)redux architecture (see [@sec:redux; @sec:ng-redux] for the original architecture), but added a "messaging-agent" more akin to the runtime in the Elm-architecture (see [@sec:elm-architecture]). The action-creators, which handle non-socket network communication, use an RDF-store for caching the RDF-data used throughout the Web of Needs. To allow using newer language features and bundle the application Webpack (see [@sec:webpack]) with Babel ([@sec:cross-compilation]) is used. Styling is done in SCSS (see [@sec:scss]) using BEM (see [@sec:bem]) as naming convention.

The version 0.2 of the Owner-webapp prototype code-base released in August 2018 that this work describes to can be found here:
<https://github.com/researchstudio-sat/webofneeds/tree/5ee83c745a599a37ade9f371620b454b2a57d258/webofneeds/won-owner-webapp/src/main/webapp>^[The full 0.2 release of the complete set of WoN-services: <https://github.com/researchstudio-sat/webofneeds/releases/tag/webofnneds-0.2>].

<!--
TODO mention hevner?
-->