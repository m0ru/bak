<!-- 

"these latter points should be in the critical reflection section" @ 04_solution.md (i.e. move the anecdotal evidence here)

what went well, what went badly:

- state-normalization changed; not flat anymore but prepared for comps
- build-change (webpack)
- still has probs due to lack of types (but easier to find the bugs)
- a lot of code ended up in action-creators
- "only stayed with Angular because switching to redux was too much new stuff and too much code-base to throw away." (otherwise would have been react)

This section will document in what ways our architecture diverges from or
builds on top of basic redux, as well as list experiences and
style-recommendations derived from using it. <!-TODO these latter points should be in the critical reflection section ->

ask colleagues?
 -->

<!--

why this particular combination of tech (redux+rdfstore-js+Angular)

ADDRESS POINTS FROM TECHNICAL REQUIREMENTS either in one section, or spread out references and then summarize.


@sec:interaction-design:

- [x] Create and post new needs: see screenshots in @sec:__
- [x] view needs/posts:see screenshots in @sec:__
- [x] Share Links: see screenshots in @sec:__
- [x] Notifications: see screenshots in @sec:__
- [x] Contact/Connection Requests: see screenshots in @sec:__
- [x] Chat messages: see screenshots in @sec:__

@sec:technical-requirements: (TODOs: referenced in text)
-->

## Discussion 

This section will briefly discuss how the design-coices made in the laid-out architecture and tooling factor towards fulfulling the technical requirments specified in section -@sec:technical-requirements. I'll try to outline where things went well and where they fell short.

### Networking

Section -@sec:server-interaction details how this is done. The messaging agent was a conceptual stand-in for handling input-output with the network (instead of on the screen as a user would). 

As it later turned out, the agent could also have been modeled as an action-creator. In this variant, regarding incoming messages, it would set up the listeners on the websocket, that in turn dispatch actions. For outgoing ones, action creators could be offered, that don't dispatch actions but rather send out messages on the websocket. This would have saved on a concept that people would need to learn and thus help towards the *"learnable in project"-requirement*, but would mean that messages don't show up in the redux-state-history anymore, thus negatively impacting the ones for "clear system state" and "clear causality". Also having a single point where everything regarding the websocket lives, makes errors easier localizable. The calls to the REST-API are also localized like this in the linkeddata-service.

### Adaptability and Extendability

This is one of the reasons, why the choice fell on (a variation of) the redux architecture. Need to change the layout? Touch the component. Need to adapt to some change of the data-structure, that doesn't affect the GUI? Touch the action creators. At least this goes for a number of cases. Larger features still tended to incur changes in action-creators, reducers and components, however. As they would in an Angular-MVC scenario with changes to services, controllers-plus-models and templates/views. 

<!--
- [ ] Adaptability/Extendability
  - [ ] easy to extend/adapt ~ realistically most features will require some ACs, some new actions, some new state and some view-changes. However, new state can easily be used in multiple views/components
  - [ ] isolated protocol: linked-data-service only used in action-creators
  -->

## Many Ontologies

Early iterations of the architecture passed through the raw JSON-LD to the components. However, this ended up with a requirement for complicated selector-functions, that needed memoization/caching of results to avoid duplicate computation. Also it made component-code less failsafe, as there was no verification that the JSON-LD would conform with expectations regarding its shape. Lastly, templates ended up harder to read. This is why the validation and parsing happens in the reducers now, that can detect deviations from expectations earlier, and that prepare the data for easy digest by the components, while still retaining the rough structure so changes to the RDF won't mean drastic changes to the reducers and views. This parsing in the reducers also means that processing only needs to happen once and no additional memory-overhead is incurred.

Kristina Weinberger, a colleague, also added a "use-case" system on top of the architecture (which is beyond the scope of this thesis). To describe it shortly, it allows specifying records of details, with details being things like "post-title" or "location". These detail-declarations include basic layout information (the component used for rendering the data, an icon, etc), as well as functions to parse from the structure in the redux-state to JSON-LD and back, as well as a function to generate a textual summary of the data. Coupled with that are a second type of declaration called "use-cases" (e.g. "find a place to rent") that select sets of details from the list of all possible details that make sense in this context (for the example: "location", "price", but not "music genre"). The different fields and functions in these declarations are used as utilities in varying reducers and components.

With this addition, that was supported under the redux-architecture, easy adaptability to different ontologies was reached.


<!--
- [ ] many ontologies: it is RDF. however, RDF stops in the reducers, that prepare it for digestion by the views. => b4 that change: massively relying on memoizing selectors to transform the data and cache results to avoid duplicate processing. also b4: reducers where kinda pointless by acting as a super-thin layer over `map.setIn(..)`. use-case system by kristina allowed dealing with that. (architecture was basis for that?)
-->

## Mobile

The component-oriented 
<!--
- [ ] Mobile: port to mobile foreseeable: has happened, was possible due to modularized structure and at least minimally maintainable SCSS (but still pain, i guess)
-->
<!--
- [ ] Responsiveness:
  - [ ] ~ time-to-first-meaningful-render could be lower and it is rather resource intensive (TODO how resource intensive?)
  - [ ] no extra round-trips: SPA 
- [ ] Thin Application Server:
- [ ] Evergreen Browsers:
- DX:
  - [ ] new language features: cross-compiling / babel
  - [ ] bug prevention: some linting; not TS/elm tho
- [ ] learnable in project: ppl were struggling with it for a while. hopefully paved way for elm?
- [ ] Retain old code-base / steady migration: rendering is still Angular, service-code used by/in action-creators.

- [ ] Clear Causality: one direction data-flow! (no loops, unless AC's call each other <- don't do that)
- [ ] Side-Effects of changes minimized: immutable(.js) data preventing spooky action at a distance. Component code can't influence system state arbitrarily (just via the actions that are visible in the redux-devtools)
- [ ] Clear Responsibilities: all side-effects go in action-creators, all parsing and transforming into the reducers and components should just take data and render them without further ado.
- [ ] Clear State: redux-devtools or `anyController.$ngRedux.getState().toJS()` provides a the entire state (except for ld-cache/rdfstore and some component state). the redux-devtools even show diffs and an action history and allow "time-travelling", i.e. going back to previous states during debugging.
- [ ] Localizable Errors: yes! code got way more defensive; between network, dispatched actions, state-diff, select-function and template code it is easier to track down problems. "one only needs to look at 3 files" <- not quite kept, but way better than circle-containing causality before. Reducers are rather defensive at what they accept / do hvy validation.
- [ ] Less code-redundancies: not sure; we have quite some boiler-plate. But it should be clearer where stuff is / reimplementation should be less likely
  - [ ] a lot of duplication in SCSS: some reuse of generic concepts, but a also a lot of rules reused in components. beats arbitrary coupling tho (i.e. if comps are going to go different ways anyway later)


-->