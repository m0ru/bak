
# Summary


This thesis lays out, why a variant of (Ng-)Redux ([@sec:ng-redux]) was picked as architecture for the Web of Needs owner application prototype (secs. [-@sec:web-of-needs], [-@sec:won-owner-application] and [-@sec:views-and-interactions]) and which adaptions were made (primarily the addition of a "messaging-agent" and an RDF-store ([@sec:server-interaction]), the choice to handle side effects via the best practice of so-called "action creators" ([@sec:action-creators]) and the use and integration of the powerful "ui-router" ([@sec:routing]). Together with the tooling-choices of using ES6 ([@sec:es6]), SCSS ([@sec:scss]) with the BEM-naming-style ([@sec:bem]), SVG-Spritemaps ([@sec:svg-spritemap]), the Webpack bundler ([@sec:webpack]). The work also gives a short walk-through through the GUI-prototype in section [-@sec:views-and-interactions].

The architecture and tooling laid out in detail in chapter [-@sec:suggested-solution] enable developing client-side GUI-applications for the Web of Needs that run on ever-green browsers, are capable of networking using RDF-data, are responsive, mobile-friendly, adaptable and extendable. It should be possible to easily learn it on-a-project and the solution made sure to remain backward-compatibility with the old code-base, thus allowing gradual migration. Additionally, from a developer experience perspective, causality and responsibility between modules/components are clearer, side effects of code changes are minimized, code redundancies have been reduced and the code made conciser. Lastly, the entire system state is now easily retrievable at any point in time.

Lastly, the detailed code-base of version 0.2 of the Owner-application prototype released in August 2018 that this work describes can be found here: 
<https://github.com/researchstudio-sat/webofneeds/tree/5ee83c745a599a37ade9f371620b454b2a57d258/webofneeds/won-owner-webapp/src/main/webapp>^[The full 0.2 release of the complete set of WoN-services: <https://github.com/researchstudio-sat/webofneeds/releases/tag/webofnneds-0.2>].

<!-- Vienna, \today -->

<!-- # Summary and Future Work -->

<!--
## Future work

* [HTTP Batching](https://github.com/researchstudio-sat/webofneeds/issues/764) via HTTP2
* [Super-slim Owner-Server](https://github.com/researchstudio-sat/webofneeds/issues/842)
* [Make WoN-app pinnable to home screen](https://github.com/researchstudio-sat/webofneeds/issues/844)
* web-workers / caching
* accessability

transitioning into a language with more type-safety, i.e. elm

want to make it possible to build small apps quickly (personal desire tho)

kristina has build a use-case engine for the application, adding use-cases / extending features.

merge with critical reflection section? the "future" work has already happened. 
-->