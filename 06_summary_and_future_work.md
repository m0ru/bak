
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

why this particular combination of tech (redux+rdfstore-js+angular)



ADDRESS POINTS FROM TECHNICAL REQUIREMENTS either in one section, or spread out references and then summarize.


@sec:interaction-design:

- [x] Create and post new needs: see screenshots in @sec:__
- [x] view needs/posts:see screenshots in @sec:__
- [x] Share Links: see screenshots in @sec:__
- [x] Notifications: see screenshots in @sec:__
- [x] Contact/Connection Requests: see screenshots in @sec:__
- [x] Chat messages: see screenshots in @sec:__

@sec:technical-requirements: (TODOs: referenced in text)



- [x] Networking: handling HTTP-REST and websockets: see diagram for how it does that
- [ ] Adaptability/Extendability
  - [ ] easy to extend/adapt ~ realistically most features will require some ACs, some new actions, some new state and some view-changes. However, new state can easily be used in multiple views/components
  - [ ] isolated protocol: linked-data-service only used in action-creators
- [ ] many ontologies: it's RDF. however, RDF stops in the reducers, that prepare it for digestion by the views. => b4 that change: massively relying on memoizing selectors to transform the data and cache results to avoid duplicate processing. also b4: reducers where kinda pointless by acting as a super-thin layer over `map.setIn(..)`. use-case system by kristina allowed dealing with that. (architecture was basis for that?)
- [ ] Mobile: port to mobile foreseeable: has happened, was possible due to modularized structure and at least minimally maintainable SCSS (but still pain, i guess)
- [ ] Responsiveness:
  - [ ] ~ time-to-first-meaningful-render could be lower and it is rather ressource intensive (TODO how resource intensive?)
  - [ ] no extra round-trips: SPA 
- [ ] Thin Application Server:
- [ ] Evergreen Browsers:
- DX:
  - [ ] new language features: cross-compiling / babel
  - [ ] bug prevention: some linting; not TS/elm tho
- [ ] learnable in project: ppl were struggling with it for a while. hopefully paved way for elm?
- [ ] Retain old code-base / steady migration: rendering is still angular, service-code used by/in action-creators.

- [ ] Clear Causality: one direction data-flow! (no loops, unless AC's call each other <- don't do that)
- [ ] Side-Effects of changes minimized: immutable(.js) data preventing spooky action at a distance. Component code can't influence system state arbitrarily (just via the actions that are visible in the redux-devtools)
- [ ] Clear Responsibilities: all side-effects go in action-creators, all parsing and transforming into the reducers and components should just take data and render them without further ado.
- [ ] Clear State: redux-devtools or `anyController.$ngRedux.getState().toJS()` provides a the entire state (except for ld-cache/rdfstore and some component state). the redux-devtools even show diffs and an action history and allow "time-travelling", i.e. going back to previous states during debugging.
- [ ] Localizable Errors: yes! code got way more defensive; between network, dispatched actions, state-diff, select-function and template code it's easier to track down problems. "one only needs to look at 3 files" <- not quite kept, but way better than circle-containing causality before. Reducers are rather defensive at what they accept / do hvy validation.
- [ ] Less code-redundancies: not sure; we have quite some boiler-plate. But it should be clearer where stuff is / reimplementation should be less likely


-->