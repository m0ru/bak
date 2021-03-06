<!-- TODO for references: when using blog-posts, thematize that academic publishing is rather slow, especially as compared to the developments in the world of web technologies. -->
<!-- Meta: for claims, just start out with a TODO-marker, then if the reference actually ends up in the finished text, find a reference to support the claim. -->

# Suggested Solution {#sec:suggested-solution}

<!-- TODO "only stayed with Angular because switching to redux was too much new stuff and too much code-base to throw away." -->

<!-- TODO RUNNING EXAMPLE -->
<!-- fkleedorfer_rsa [5:25 PM]  -->
<!-- vielleicht ein 'running example' im suggested solution teil? -->
<!-- an dem man sehen kann was man schreiben muss, um in der architektur was einzubauen -->
<!-- zb: User tippt eine message und drückt enter -->

<!-- TODO REGEAR TO COMPARISON OF TOOLS AND WHEN TO CHOOSE WHAT (for similar scenarios as ours) -->
<!-- FK: ist doch schon mal was.. vielleicht eine vergleichsmatrix oder längeres eingehen auf die gründe für die Wahl? -->

<!--     * NOTE: The Architecture fails somewhat at keeping sync state across tabs, implementing that is a lot of effort on top of it. Theoretically we could serialize and sync the entire state (making sync a lot easier than with Angular and flux), but it’s still no Falcor, Relay or Meteor(?) in that regard. -->

<!-- TODO requirements for a full stack: in the problem-descripion: list challenges that need to be tackled by web applications:

* [ ] separation of concerns
  * [ ] suitability for collaboration
  * [ ] reusability of code
* [ ] move processing to client / minimal number of requests (justification for JS-apps)
* [ ] networking
* [ ] optimize page load:
  * [ ] less HTTP-requests -> bundling
  * [ ] smaller size -> minification
  * [ ] precompiling templates
* [ ] managing dependencies between scripts -> module systems
* [ ] simplicity / a low number of concepts / gentle learning curve
* [ ] predictability / maintainability
* [ ] {reduces redundancies} ->
-->

As already mentioned in the problem description ([chapter @sec:probdescr]), the rework and restructuring started with a codebase using Angular (see [section @sec:angular-mvc]), all modules included one-by-one in an `index.html`, and some bootstrap-theme for styling. Bugs were hard to solve due to the "grown" code-base and the somewhat ambiguous architecture stemming from both the wide range of concepts in Angular that required understanding and best-practices
as well as our grasp of them. Additionally, the visual style was neither polished nor projected a unique identity.

As part of a research-project together with our partner Meinkauf, the Researchstudio Smart Agent Technologies was tasked with developing a platform-independent mobile application. For this project we used Ionic [@IonicFramework], i.e. a tooling default, that at the time consisted of Phonegap[@PhoneGapa], Angular 1.x, SCSS (see [section @sec:scss]), ionic-specific CSS and its own command-line-tool. As such, that work presented a good opportunity to try out a different architecture, to deal with the ambiguities and maintenance problems we were experiencing with the Web of Needs owner-application.

<!--
TODO TODO TODO

## Technology Stack {#sec:technology-stack}

* meinkauf app -> ng-redux has good DX

components:

* bi-directional binding was causing a lot of bugs (how many?) -> less Angular
* migrate -> ng-redux instead of react
* modularity -> slightly lessened by redux. reusable components shouldn't be connected to redux but gain input via properties. most components are clearly app-specific anyway.
* separation of conerns -> all do that, redux does it with less concepts / clearer imo
* redux reduces problems with asynchronity (the actions make app behavior predictable / understandable / replayable -- tbh, the same would go for events on the Angular root)
* Angular has problems with triggering events while a dispatch is in progress (we had problems with endless loops a few times)

* Migration:
  * started off with ng-app
  * meinkauf app as test-field
  * Reducing bootstrap usage.
  * Promises: $q to native.
  * started with router and core reducers(?)
  * a lot of mocking → smooth collaboration
  * how did we migrate, step-by-step (central redux architecture first, then add components, write import wrapper for won.js, restructure linkeddata-service.js)

build tool: pure npm vs grunt vs Gulp vs brunch?

* too complex for chaining commands in npm (< ~ is it really?)
* Gulp seemed to be best practice with its pipes (with grunt being too old and brunch not well known)
* TODO better arguments

dependency mngmt - npm vs bower vs jspm vs yarn:

* not all packages on npm
* bower has many gui packages but no perceivable advantage beyond that and makes the build more complex
* jspm also integrates packaging and crosscompiling and can do npm, bower and github as source
* yarn beats npm for speed and predictability but can only do npm as source (afair)

why bundle at all: no endless include lists in index.html anymore
module syntax - amd/requirejs/commonjs vs es6: es6 is the standardized way
bundling - Browserify vs Webpack vs jspm:

css-pre-processor - less vs sass: more people (TODO numbers) and better tooling for sass. both have similar functionality

css framework: we also switched away from bootstrap, as we'd need to modify it’s styles that heavily anyway

css code-styling - oocs vs bem: we're not trying to develop a generic style atm (though we probably could have developed against the bootstrap/semcss/tachyon list of classes). bem avoids name-clashes (due to css' global name-space) and has a focus on components. however, turns out that oocss seems to more reusable and easy to learn (link to sources of pro-oocss article)

-->

<!-- 
## Research Rigor {#sec:research-rigor}

"Design-science research relies upon the application of rigorous methods in both the construction and evaluation of the design artifact."

TODO This means applying existing foundations and methodologies, using effective metrics and formalizing. Note however, that an overemphasis on rigor can often lead to lower relevance [@LeeInauguralEditorComments1999], as many environments and artifacts defy an excessive formalism (see "wicked problems" at footnote [^fn:wicked]). <!--TODO better reference / use glossary entry

requirements:

• Create and post new needs. Currently these consist of a simple data-structure with a subject, textual description and optional tags or location information.
• View needs and all data in them in a human-friendly fashion
• Share links to posts with other people
• Immediately get notified of and see matches, incoming requests and chat messages
• Send and accept contact/connection requests
• Write and send chat messages

• good DX (TODO define)
• Needs to be able to keep data in sync between browser-tabs running the JS-client and the Java-based server. This happens through a REST-API and websockets.  Most messages arrive at the WoN-Owner-Server from the WoN-Node and just get forwarded to the client via the websocket. The only data directly stored on and fetched from the Owner-Server are the account details, which needs belong to an account, its key-pair and information on which events have been seen.
• As subject of a research-project, the protocols can change at any time. Doing so
should only cause minimal refactoring in the owner-application.
• In the future different means of interactions between needs – i.e. types need-to-need connections – will be added. Doing so should only cause minimal changes in the application.
• Ultimately the interface for authoring needs should support a wide range of ontolo- gies respectively any ontology people might want to use for descriptions. Adapting the authoring guys or even just adding a few form input widgets should be seamless and only require a few local changes.
• We didn’t want to deal with the additional hurdles/constraints of designing the prototype for mobile-screens at first, but a later adaption/port was to be expected.  Changing the client application for that should require minimal effort.
-->

<!--
## Process {#sec:process}

TODO Flo: "I think it is interesting to describe the actual process, but you should not over-emphasize it. In the end, you came up with a design and an implementation, and that is the artifact you produced.

If you can show multiple iterations of your artifact with 'experiments' evaluating its appropriateness and refinements, fine - but don't zoom into the microscopic level (first I read this, then that, ...).

"

**argument:** feasibility wasn't clear to begin with!!! -> it is research

1. peacemems notifies me of react
2. reading that, i also stumbled across flux
  * flux-article talks about problems with Angular/bi-directional data-bindings resonates (same problems when debugging prev prototype) (?)
3. meinkauf app -> design by ulf(?), testing ionic (for mobile) and ng-redux. DX is good (TODO define DX)
4. new ulf screens for won-app → we’ll need to rewrite (?)
4. rewriting with the old Angular setup (Angular 2 isn’t production ready)
4. pre-compilation (js, scss) and bundling setup
  * we also switched away from bootstrap, as we'd need to modify it’s styles that heavily anyway
4. actually: when stores and synching via the ws became a thing, started researching flux, ended up stumbling across redux (#342)
  * apparently, we were using flux even before that (see #342). it’s part of a commit from 23 Sep 2015 (1395ba6) and was only used to test with a draft store, so nvm.
  * and compared different implementations ( 	b824aa2)
6. read up on redux and ways to integrate with existing code-base
7. implementation
  * Frankangular - the Migration Process. Reducing Angular to a rendering stage.
  * Frankangular - Duplicate imports :{
  * Migration:
      * Reducing bootstrap usage.
      * Promises: $q to native.
   * started with router and core reducers(?)
   * a lot of mocking → smooth collaboration
8. usability tests (?) not really part of architecture

* Meta: möglichst so, dass ich nichts mehr machen soll
* Meta: Write in a way that large parts can be used as WoN-documentation(?)
* Meta: always spell in full first names of female authors for references
* Meta: repeat important points with different wordings.

“iteratively identifying deficiencies in prototypes and creatively developing solutions to address them” (Markus et al., 2002)

medium.js text field

rdfstore-js:

* use it for caching but not as redux store
* accessing it is asynch (reducers are synchronous)
* not all app data is described in rdf

compare with other architectures (Angular 1.X, flux, cyclejs’ mvi, elm,...)

how did co-workers deal with it? ease of use?

interaction/integration with project mngmt workflows. e.g. pull-requests, mocking,...

more difficult architectural decisions:

* Routing
* Rdf-store
* Access Management

## Relevant Github-Issues

* [Owner App README](https://github.com/researchstudio-sat/webofneeds/tree/master/webofneeds/won-owner-webapp) basically describes our redux setup
* [The New Code Base Structure - Structure Diagrams, Refactoring and more](https://github.com/researchstudio-sat/webofneeds/issues/151) (#151)
* [Map widget](https://github.com/researchstudio-sat/webofneeds/issues/222)  (#222) and [marker clustering](https://github.com/researchstudio-sat/webofneeds/issues/227) (#227)
  * leafletjs and osm
* [Address forms](https://github.com/researchstudio-sat/webofneeds/issues/226) (#226)
* [Password-retyping unnecessary if reset-via-email works](https://github.com/researchstudio-sat/webofneeds/issues/264) (#264)
* Experiences with contenteditable ([#278](https://github.com/researchstudio-sat/webofneeds/issues/278))
* [Angular 2.0](https://github.com/researchstudio-sat/webofneeds/issues/300) (#300)
* [Precompilation and Tooling (Bundling, CSS, ES6)](https://github.com/researchstudio-sat/webofneeds/issues/314) (#314)
  * bundling, SVG sprites, sass, es6,...  - why and how?
  * SASS and BEM. Also, address Semantic CSS (!)
* [SVG-sprites](https://github.com/researchstudio-sat/webofneeds/issues/318) (#318)
* [Template Parsing Performance](https://github.com/researchstudio-sat/webofneeds/issues/319) (#319) - jsx
* [Speech-Bubble-CSS](https://github.com/researchstudio-sat/webofneeds/issues/333) (#333)
  * Afair we now use a better version by simply rotating a div with a border.
* [Documentation-generator](https://github.com/researchstudio-sat/webofneeds/issues/337) (#337)
* [Actions/Stores and Synching ](https://github.com/researchstudio-sat/webofneeds/issues/342) (#342)
  * meta: figures in issue need updates
  * this is the issue that triggered the redux research.
  * Redux ~ Elm Architecture ~ CycleJS Model-View-Intent. The parts (Action-Creators / Actions, Reducers, Views). Insights on handling side-effects (e.g. server-side interaction)
  * dealing with rdf-store
* [Routing and Redux](https://github.com/researchstudio-sat/webofneeds/issues/344) (#344)
* [chrome’s security](https://github.com/researchstudio-sat/webofneeds/issues/372) (#372)
* [WebSocket only created before login](https://github.com/researchstudio-sat/webofneeds/issues/381) (#381)
* [Direct link to need](https://github.com/researchstudio-sat/webofneeds/issues/517).
* [nicer URLs via html5mode in ui-router](https://github.com/researchstudio-sat/webofneeds/issues/520) (#520)
* [Speed up build](https://github.com/researchstudio-sat/webofneeds/issues/577) (#577) aka "`jspm install` is slow when you need to run it on every build"
* [Page-load performance optimisation](https://github.com/researchstudio-sat/webofneeds/issues/546) (#546)
* [Human-friendly timestamps ](https://github.com/researchstudio-sat/webofneeds/issues/549) (#549) → tick actions
* [Load data selectively](https://github.com/researchstudio-sat/webofneeds/issues/623) (#623) – Paging
* [Flatten content-node of needs](https://github.com/researchstudio-sat/webofneeds/issues/719) (#719)
* [direct link to conversation not working](https://github.com/researchstudio-sat/webofneeds/issues/728) (#728)
* Unify Directives: Overview » Incoming Requests and Matches List
* Unify Directives: Chat and Incoming Request and Outgoing Request
* [Usability Tests of Demonstrator](https://github.com/researchstudio-sat/webofneeds/issues/752) (#752)
* [Displaying Needs with Arbitrary RDF](https://github.com/researchstudio-sat/webofneeds/issues/1721)
* [Abstract edit- and view-components for pieces of data](https://github.com/researchstudio-sat/webofneeds/issues/1733)
* [Use npm-lock-file](https://github.com/researchstudio-sat/webofneeds/issues/1619)
-->

## Architecture {#sec:architecture}

<!-- TODO {Reword so it fits into the thesis. Change all links to github issues
to point to other sections of the thesis.} -->
<!--TODO {describe why other architectures weren't used, i.e. mehr bezug zu state-of-the-art}-->

<!--TODO  {describe why other architectures weren't used, i.e. mehr bezug zu state-of-the-art}
* (Angular-)mvc:
* mvvm
* react
* flux
* elm-architecture: would require vdom (actually how flux/redux should look like. in Angular we can't do `view : Model -> Html Msg`). purity of elm would be nice :3
* cyclejs mvi

tbh, any of these architectures can solve the technical requirements
crux is additional technical requirements:
* clear causality:
* minimize side-effects:
* separated responsibilities:
* transparent system state:
  * (Angular-)mvc: separated state. a lot also held in controllers and views/components (bad design, but temptation is there to quickly fix a problem). actually, the previous app didn't have a proper model at all (except for the data fetched from the server(s)). We hadn't yet figured out responsibilities and were just solving problems as they appeared wherever they appeared (i.e. often-times directly in the components)
  * mvvm:
  * react: separated state
  * flux
  * elm-architecture:
  * cyclejs mvi
* vs weakly typed:
  * with redux a lot of bugs theoretically should be detectable already in the reducer. however in-practice they are written pretty lenient, to allow the app to gracefully degrade when data is missing. On the plus side, as long as there is no code-dupslication, any debugging should maximally require looking three files (an action-creator, a reducer, a component) (and any subroutines of these)
-->

We are using a variation of the redux-architecture (see sections [-@sec:redux] and [-@sec:ng-redux] respectively) for the won-owner-webapp JavaScript-client.

This section documents in what ways our architecture diverges from or
extends basic redux and lists experiences and
style-recommendations derived from using it. <!--TODO these latter points should be in the critical reflection section -->

![Redux architecture in client-side owner-app](figures/owner_app_redux_architecture.svg){#fig:adapted-redux}

### Action Creators {#sec:action-creators}

Anything that can cause **side-effects** or is
**asynchronous** should happen in action creators (tough they can also
be synchronous -- see `INJ_DEFAULT`) <!--TODO code snippet -->
They should only be triggered
by either the user or a push from the server via the
`messagingAgent.js`. In both cases they cause a
**single**(!) action to be dispatched and thus passed as
input to the reducer-function.

All actions are declared in the `actionHierarchy`-object in `action.js`. From that two objects are generated:

- `actionTypes` which contains string-constants (e.g. `actionTypes.drafts.change.title === 'drafts.change.title'`)
- `actionCreators` which contains the action creators. For the sake of injecting them with ng-redux, they are organized with `__` as separator (e.g. `actionCreators.drafts__change__title('some title')`

The easiest way to create actions without side-effects is to set it to `INJ_DEFAULT` (instead of specifying an action-creator function) in the `actionHierarchy`. The bootstrapping process will see this constant and _generate_ a corresponding action-creator in `actionCreators` (instead of just copying the reference to aforementioned function). This `INJ_DEFAULT`-action-creator just dispatches all function-arguments as payload. E.g. `actionHierarchy.myAction = INJ_DEFAULT` leads to  
`actionCreators.myAction = argument => ({type: 'myAction', payload: argument})` being generated.

Actions and their creators should always describe
**high-level user stories/interactions** like
`matches.receivedNew` or `publishPost`
(as opposed to something like `matches.add`
or `data.set`).
Action-creators
encapsulate all computation with side effects, as opposed to the reducers
which (within the limits of JavaScript) are guaranteed to be
side-effect-free. Thus, we should have
**as much of our business-logic as possible within the reducers**.
This decreases the surprise-factor, coupling and bug-proneness
of our code and increases its maintainability.

### Actions {#sec:actions}

Actions are objects that serve as input for the reducer. Usually they
consist of a type and a payload such as the one below. In general, actions 
should describe high-level interactions from the user (or
server if initiated there).  

```{.js #fig:actionjson caption="Example action object"}
{
  type: "needs.close"
  payload: {
    ownNeedUri: "https://node.matchat.org/won/resource/need/1234"
  }
}
```


<!-- TODO See:  Actions/Stores^[<https://github.com/researchstudio-sat/webofneeds/issues/342> (accessed 18.06.2018).] and Syncthing TODO should be in-thesis ref
-->

### Reducers {#sec:reducers}

Reducers are **side-effect-free**. Thus, as much of the implementation
as possible should be here instead of in the action-creators. This allows us
to profit from the guarantee and, in consequence steer clear of possible sources for
bugs that are hard to track down.

Usually they will consist of simple switch-case statements. A simple
reducer that would keep track of own needs could (in-part) look as
follows:

```{.js #fig:reducer caption="Simple example reducer."}
import { actionTypes } from '../actions/actions';
import Immutable from 'immutable';
import won from '../won-es6';

const initialState = Immutable.fromJS({
    //...
    ownNeeds: {},
});

export default function(allNeeds = initialState, action = {}) {
  switch(action.type) {
    case actionTypes.logout:
      return initialState;

    case actionTypes.needs.close:
      return allNeeds.setIn([
        "ownNeeds", action.payload.ownNeedUri, 'won:isInState'
      ], won.WON.InactiveCompacted);

    //...

    default:
      return allNeeds;
}
```

### Components {#sec:components}

They live in `app/components/`. <!-- TODO put into appendix? -->

Top-level components (views in the Angular-sense) have their own folders
(e.g. `app/components/create-need/` and are split in two files).
You need to add them to the routing (see below) to be able to switch
the routing-state to these.

Non-top-level components are implemented as directives. A very simple
demo-component that would render the title and description of a need to
the DOM-tree and allow closing it (i.e. making it unreachable to contact
requests) via a click on "[CLOSE]", would look as follows:

```{.js #fig:example-component caption="Example component."}
import angular from 'angular';
import 'ng-redux';
import { actionCreators }  from '../actions/actions';
import { attach } from '../utils.js'
import { seeksOrIs, connect2Redux } from '../won-utils'

// angular utilities required to integrate the component
// into the redux architecture via the `connect2Redux`-
// function.
const serviceDependencies = ['$ngRedux', '$scope'];

// factory function for the directive:
function genComponentConf() {

  const template = `
    <h1>{{ self.needContent.get('dc:title') }} [DEMO]</h1>
    <p>{{ self.needContent.get('won:hasTextDescription') }}</p>
    <a ng-click="self.needs__close(self.need.get('@id'))">
        [CLOSE]
    </a>
  `;

  class Controller {
    constructor() {

      // does `controller.<serviceName> = <serviceName>`
      // for all services injected via `arguments`
      attach(this, serviceDependencies, arguments);

      const selectFromState = (state) => {
        const need =
          state.getIn(['needs', 'ownNeeds', this.needUri]);

        // need and needContent will be bound to the
        // controller (=scope) and thus be available
        // in the template.
        return {
          need,
          needContent: need && seeksOrIs(need),
        }
      };
      connect2Redux(
        selectFromState, // result will be bound to `this`
        actionCreators, // will be bound to `this`
        ['self.needUri'], // component property used in select
        this // the controller
      );
    }
  }
  Controller.$inject = serviceDependencies;

  // directive configuration:
  return {
    scope: { needUri: '=' }, // available property on HTML-tag

    controller: Controller,
    template: template

    restrict: 'E', // directive only usable as HTML-tag
    controllerAs: 'self', //ctrl available as `self` in template
    bindToController: true, //ctrl is scope for template
  }
}

export default angular.module(
  'won.owner.components.demoComponent',
  [ /* here: any dependencies using angular */ ]
)
.directive('wonDemoComponent', genComponentConf)
.name
// ^ exported name used by importing component in dependency-array
```

The component can then be used by a **parent component** via:

```{.js #fig:usage-in-parent-component caption="Usage in parent component."}
// ...

import demoComponentName from './demo-component.js'

// ...

function genComponentConf() {
  const template = `
    <h1>All Owned Needs</h1>
    <won-demo-component
      ng-repeat="uri in self.needUris"
      needUri="uri">
    </won-demo-component>`

  //...
}

export default angular.module(
  'won.owner.components.demoParent',

  // so angular knows to run the child first:
  [ demoComponentName ]
)
.directive('wonDemoParent', genComponentConf)
.name
```

As demonstrated above, there is a considerable amount of boiler-plate required by Angular.
All that is required by (ng-)redux is the listener to the state set up
by `connect2Redux`.

There are a few specifics points in the boiler-plate code above,
that make working with Angular 1.X a lot less painful. These are described in the following sub-sections.

#### Service Dependencies {#sec:component-service-deps}

The `serviceDependencies` lists the Angular services that will
be passed to the constructor of the directive.
Assigning that array with the dependency-names to the Controller class via
`$inject` ensures that Angular does just that, even if the code
is minified. Per default Angular reads the names of the arguments of
the constructor, but during minification that information is lost. By
setting `strictDi: true` when starting up angular in
`app/app_jspm.js` <!-- TODO put into appendix? -->
we ensure Angular complains if the injection array isn't there.
The `attach`-function then takes the constructor's arguments
(i.e. the injected service dependencies) and assigns them as properties
to the controller-object.

#### Template Strings {#sec:component-template}

The template strings (`const template = '...'`) describe the HTML that the user gets to see. When a component is first rendered, Angular parses the string and generates the required HTML, starts up any required child-components and directives, and evaluates any expressions in double curly braces and then replaces them with the result of that respective expression. E.g. `<h1>{{ self.needContent.get('dc:title') }} [DEMO]</h1>` might become `<h1>Couch to give away [DEMO]<h1>`. It also ensures that whenever these expressions change, the DOM is updated. To do this it sets up a so called "watch" per expression. Every time a `$digest`-cycle is triggered, all watch-expressions are evaluated and necessary changes to the DOM made one at a time. This is also what makes Angular 1.x terribly imperformant compared to virtual-DOM frameworks that batch updates like React and the Elm-runtime. `$ngRedux` ensures a `$digest`-cycle is triggered every time the redux state has been updated. Managing these `$digest`-cycles can be complex and it lead to lead hard-to-track-down bugs.

Also, in the template, the
`ng-click="self.needs__close(self.need.get('@id'))"`
sets up a listener for a click event on the element, that executes
the code in the double quotes. In this case, it calls the action-creator
`needs__close` with a specific need-uri, that makes an HTTP-request to the server and on success creates an
action-object and dispatches it, thus triggering a state-update.

#### Listening for State-Changes {#sec:component-redux-connect}

Ng-redux provides us with the utility function
`$ngRedux.connect(selectFromState, actionCreators)(controller)`
that `connect2Redux` uses internally. What it does is to set up
a listener on the state managed by ng-redux. Every time the state is
updated, `selectFromState` is run on it. Its return object is
then assigned property-by-property to the `controller`. As a
convenience-feature, the functions in `actionCreators` are wrapped
with a call to `$ngRedux.dispatch` and also get assigned
to the `controller` when the component is initialized. Otherwise
it would be necessary to write
`self.$ngRedux.dispatch(self.someAction(...))`
everywhere in the component that the action is triggered.

Note that `selectFromState` can be used to transform the data that should be stored
in a normalized, redundancy-free fashion in the state, into something
that is easier to consume in the component. Frequently used selection-functions
can be found in
`app/selectors.js`. <!-- TODO put into appendix? -->
Many of these use
reselect [@BannardSelectorlibraryRedux2019]
that allows caching the results of computations until their dependencies change.
This way, if e.g. the list of connections with their related needs and events is needed
by multiple components on the screen, the filter and group operations are only run once
(instead of once per component selecting that data).

As a secondary function, `connect2Redux` also unregisters any
listeners and watches when the component is removed.

#### Essential Component Boiler-Plate Code {#sec:component-boilerplate}

The following directive configuration helps to simplify Angular-component-code and prevent bugs:

``` {.js #fig:directive-config caption="Essential directive configuration boiler-plate."}
{
  scope: { },
  //...
  restrict: 'E',
  bindToController: true,
  controllerAs: 'self',
}
```

Of these, the first is the most important. It allows specifying custom properties
for the component. However, even when there are no properties, one should
always specify an (empty) scope object. This "isolates" the scope in Angular-terms.
Without it, when a property is requested (e.g. in the template) and it is not
found on the directive itself, Angular will continue to look for the property
in the scope of the enclosing directive or view. Not only will it read
data from there, when variables are assigned, it will also write there(!). Thus,
when you assign to a variable of the same name as a parent component's, you
change the value there as well, causing (almost certainly unintended) consequences there.

The `restrict`-field ensures that the directive is only used as HTML-tag.
Without the constraint it would also be usable as HTML-tag-property or even class. 
However, when writing a component, the HTML-canonical way is to declare a custom tag, 
thus the limitation via `restrict: 'E'`. There are a few cases for directives, that 
need and should be specified as attributes, e.g. things like `ng-click`. 

Of the other options `bindToController`
ensures that the controller is used as scope-object, instead of having a seperate one 
in addition to the controller. It thus avoids juggling _two_
JavaScript-objects and puzzling to which the data is attached. `controllerAs`
exposes the controller to the template as `'self'` (in this case).

### Routing {#sec:routing}

For routing we use
ui-router [@Thielenuirouter2019]
and in particular the redux-wrapper [@FentonreduxuirouterngReduxbindings2018].

Routing is configured in `configRouting.js`. <!--TODO put into appendix -->
State changes are triggered via the asynchronous action creator
`actionCreators.router__stateGo(stateName)`.
The current
routing-state and -parameters can be found in our app-state:

```{.js #fig:routing-params-in-state caption="Routing parameters in redux state."}
// For the URL https://www.matchat.org/owner/#!/post/?postUri=https:%2F%2Fnode.matchat.org%2Fwon%2Fresource%2Fatom%2Fc0tx8imee868
$ngRedux.getState().get('router')
=>
{
  // the current routing state
  "currentState": {
    // name of the routing state (used for navigating there)
    "name": "post",
    // the current state's URL structure including all possible parameters
    "url": "/post/?postUri?viewAtomUri?viewConnUri"
  },
  // values of the parameters that are actually used
  "currentParams": {
    "#": null,
    "postUri": "https://node.matchat.org/won/resource/atom/c0tx8imee868"
  },
  // the routing state before the current one
  "prevState": { ... },
  // the routing parameters before the current one
  "prevParams": { ... }
}
```

### Server-Interaction {#sec:server-interaction}

<!-- TODO longer code examples -->

As specified in the problem description (in particular sec. -@sec:technical-requirements), the application needs to fetch linked-data via a REST-API and receive updates via a web-socket. This section covers how this is done in the implemented architecture.

For any **REST**-style requests,
`fetch(...).then(data => {...dispatch(...); })` is used in action-creators. If they are **linked-data-related**, the utilities in
`linkeddata-service-won.js` are used. They use standard HTTP(S) but
ensure to cache as much as possible via the local triplestore [@GarroteJSRDFstore2016]. However, in the future this custom caching layer can be replaced by using HTTP2 to load the large number of RDF-documents[^manydocs] in one round-trip and let the browser-chache handle repeated requests. One advantage of the triple-store is that it stores the RDF in its natural state and additional data can just be "poured" into it. Anything, e.g. data related to a need, can be retrieved from the store using a SPARQL-query [@HarrisSPARQLQueryLanguage2013] and transformed into a desired JSON-data-structure via JSON-LD-framing [@KellogJSONLDFraming2019]. A price here however is performance -- some SPARQL-queries performed very badly and needed to be replaced by work-arounds. Another price is complexity, as the custom caching logic written to avoid unnecessary HTTP-requests yet keep the store in synch with the node-server is a frequent source of hard to track down bugs. <!-- TODO how hard? give number, e.g. percentage of total bugs -->

[^manydocs]: ad large number of documents: when your entire state contains of a single contact request, you still need to load 6 documents, in 3-5 round-trips: your need, its connection container, the connection to the other person's need, its event container, the event, and lastly the other person's need.

JSON-LD is **sent** to the server **via a websocket-connection**. For this, case-statements for the respective action are added in `message-reducers.js` that adds them to the message-queue in `state.getIn(['messages', 'enqueued'])`. The messaging agent picks theses up and pushes them to the websocket it manages.

New messages pushed by the server are **received via the web-socket,** that's managed by the messaging agent. Upon receiving a message, said agent pass it on to a series of message-handlers until responds that it's responsible for this type of message. The handler then goes on to dispatch corresponding actions.

Conceptually, the messaging agent acts similar to a user faced with output from the system and capable of returning input, but towards the network (see fig. -@fig:adapted-redux). It can trigger actions, like a user could via e.g. button presses, and does so when it receives messages via the web-socket. Additionally, it sees the result of the state, like a user would -- except it doesn't get to see rendered DOM but rather it is message queue, that it forwards to the owner-server.

## Views and Interactions {#sec:views-and-interactions}

For the sake of completeness and to illustrate the usefulness, this section will give a very brief overview of the GUI built with the architecture and tooling laid out in this thesis and how the GUI ties back into the architecture in general. For a detailed code example of a simple component see @fig:example-component in @sec:components.

The figures in this section
illustrate the process of authoring a new need ([@fig:authoring-need]),
getting matches to it ([@fig:getting-match]),
making a contact request ([@fig:made-request]),
that is then accepted by the other person ([@fig:accepting-request]),
and chatting with them ([@fig:chatting]). This is the core workflow in the WoN owner-application prototype and covers the interactions laid out in the problem-description-subsection [@sec:interaction-design]. Note that in the given example the person using the application was already logged in (using an anonymous account). If they weren't, they could either start by signing up via a standard signup-form or just going through the same process of authoring a need, that will create an anonymous account for them as a side-effect. This lattter process adds a so-called "private ID" to the URL, so they can bookmark it via their browser.

![Authoring a need (right half of the screen) with an anonymous account (top-right) and some previously created needs (left half).](./figures/matchat-screenshots/2018-06-28_15-21-17_authoring-need.png){#fig:authoring-need}

![Got the match (white card on the left) on another account (top-right). Viewing its details (right half) with option to send a contact request (bottom-right). There's also another connection with a send contact request to the owner of "Spatzle lessons" on the left and some archived posts on the bottom left.](figures/matchat-screenshots/2018-06-28_15-22-33_getting-match.png){#fig:getting-match}

![Right-side after making a contact request: waiting for the other person (the anonymous account) to accept (or decline) the contact request.](figures/matchat-screenshots/2018-06-28_15-24-13_made-request.png){#fig:made-request}

![Right-side of the person receiving the contact request: they can eiher accept or decline the contact request. They are in the progress of writing a message to send along with the accept.](figures/matchat-screenshots/2018-06-28_15-25-51_accepting-request.png){#fig:accepting-request}

![Right-side: a bit later in the conversation -- several messages have been sent.](figures/matchat-screenshots/2018-06-28_15-27-53_chatting.png){#fig:chatting}

<!--

![Right-side: A meeting on the next saturday is about to be formally proposed via the proposal/agreements mechanism.](figures/matchat-screenshots/2018-06-28_15-31-07_proposing-agreement.png){#fig:proposing-agreement}

![Right-side: A meeting on the next saturday has been formally approved via the proposal/agreements mechanism.](figures/matchat-screenshots/2018-06-28_15-31-33_proposed.png){#fig:proposed}

![Right-side: The formal proposal for a meeting on next saturday has been accepted.](figures/matchat-screenshots/2018-06-28_15-32-42_accepted.png){#fig:accepted}

![Top-right: the connection's drop-down allows to show the details of the other person's post (not just the title and title-image). "Show Agreement Data" would show a summary of all formal agreements. "Remove Connection" would close the chat so that another contact-request-and-accept-cycle would be needed to resume chatting.](figures/matchat-screenshots/2018-06-28_15-34-30_connection-menu.png){#fig:connection-menu}

![Top-right: The account menu allows accesing the "about"-page that describes the concept behind the Web of Needs and also gives the option to show the RDF-data behind messages, connections and posts directly or as links to the TTL on the nodes (right-half). This feature has been included for demonstration purposes.](figures/matchat-screenshots/2018-06-28_15-35-20_show-rdf.png){#fig:show-rdf}

![Right-half: Need-details with "Show RDF" activated. There's a link to the syntax-highlighted TTL on the node-server and also the TTL itself at the bottom-right.](figures/matchat-screenshots/2018-06-28_15-36-21_show-rdf-in-need.png){#fig:show-rdf-in-need}

![Top-right: The drop-down-menu of owned needs allows to archive and dearchive them. When they are archived they show up greyed out on the bottom left (and can't be found and interacted with by other people.)](figures/matchat-screenshots/2018-06-28_15-50-02_about-to-archive-post.png){#fig:about-to-archive-post}

![](figures/matchat-screenshots/2018-06-28_15-33-33_accepted-plus-more-chat.png){#fig:accepted-plus-more-chat}

![Right-side of the person receiving the contact request: they can eiher accept or decline the request.](figures/matchat-screenshots/2018-06-28_15-24-59_received-request.png){fig:received-request}

![](figures/matchat-screenshots/2018-06-28_15-14-31_overview.png){#fig:overview}
![](figures/matchat-screenshots/2018-06-28_15-16-43_making-request.png){#fig:making-request}
![](figures/matchat-screenshots/2018-06-28_15-17-19_request-made.png){#fig:request-made}
![](figures/matchat-screenshots/2018-06-28_15-20-01_authoring-a-need.png){#fig:authoring-a-need}
-->

<!--

TODO screenshots and short walk-through through the application, the state structure(?) and the action structure(?)

feedback @fkleedorfer: "In [@sec:architecture] beschreibst du die allgemeinen Prinzipien, nach denen die Applikation funktioniert. Jetzt beschreibe die Applikation selber:

* [ ] Views
* [ ] Benutzerinteraktion
* [x] Kommunikation mit Server
* [x] Anbindung des RDF-Store

(muss aber nicht lang sein - man soll nur einen Eindruck bekommen, was die Applikation eigentlich tut)

-->

## Tooling {#sec:tooling}

<!-- TODO Tooling

* linting

* intellij or vscode

* {https://github.com/researchstudio-sat/webofneeds/issues/300}{Angular 2.0} -> it wasn't ready at the time of the decision
* {https://github.com/researchstudio-sat/webofneeds/issues/314}{Precompilation and Tooling (Bundling, CSS, ES6)}
-->

### ES6 {#sec:es6}

As mentioned in [section @sec:technical-requirements], one of the goals was to improve the quality of the code, its readability and authoring support, especially regarding expressiveness, robustness, conciseness and bug prevention. For this it seemed natural to start using features from the latest JavaScript standard (at the time of writing ES6, also known as ES2015, optionally plus experimental features). Amongst others, this would give us access to:

- ES6-style variable declarations (e.g. `const x = 2; let y = 3; y = 1`) to prevent accidental variable overwriting through redeclaration.
- Native promises (e.g. `asynchronousFunction().then(x => /*...*/))`) to handle asynchronicity.
- Async-await (e.g. `const x = await asynchronousFunction()`) to write asynchronous code as if it were not.
- Arrow-functions (e.g. `x => 2*x` instead of `function(x) { return 2*x }`) as more concise syntax.
- Destructuring assignment (e.g. `const { a, b } = someObj`) to get fields of objects, especially when having multiple return arguments from a functions.
- Spread operators (e.g. `[1, 2, ...anotherArray, 4]` or `{a: 1, ...anotherObject}`) to concisely copy properties.
- ES6-Modules (e.g. `import { someFn } from './moduleA.js`) as a standardized module syntax (instead of CommonJS and ASM)
- etc

As some of these features weren't fully supported by all browsers cross-compilation to older JavaScript versions was necessary. Also, the module-syntax required a bundler, that combines the JavaScript modules into one file, that can be included via a `<script>`-tag.

#### ES6-style Variable Declarations

ES6 also provides `const`-variables, that throw errors when trying to accidentally reassign them, and `let`-variables that behave like variable-declarations in other C-style-languages would. In contrast, `var`-declarations are always scoped to the parent-function not the containing scope, e.g. in an `if`. Thus they can be silently re-declared, potentially causing bugs in unsuspecting developer's hands.

#### Promises

These are a fix to the so-called callback hell, i.e. code like the following:

```{.js #fig:callback-hell caption="Callback hell."}
won.login(credentials, function(error, userInfo) {
  if(!error) {
    won.getOwnedNeedUris(function(error, needUris) {
      if(!error) {
        for(int i = 0; i < needUris.length; i++) {
          var needs = [];
          won.getNeed(needUris[i], function(error, need) {
            if(!error) {
              needs.push(need);
              if(needs.length === needUris.length) {
                // all callbacks have resolved, pass the result on to redux
                dispatch(actionCreators.initialPageLoad({
                  needs: needs,
                  userInfo: userInfo,
                }));
              }
            }
            else {
              handlePageLoadError(error);
            }
          }
        }
      } else {
        handlePageLoadError(error);
      }
    })
  } else {
    handlePageLoadError(error);
  }
})
```

With promises, arrow-functions[^fn:arrowfunctions] and the enhanced object literals^[`{needs, userInfo}` as syntactic-sugar for `{needs: needs, userInfo: userInfo}`] this looks like:

[^fn:arrowfunctions]: a conciser function syntax with slightly different behavior regarding the `this`-keyword, i.e. it doesn't rebind it to the local scope, making them good for use within methods of ES6-style classes [@EcmaScript sec. 14.2 Arrow Function Definitions].

```{.js #fig:promises-in-use caption="Same example but using promises"}
won.login(credentials)
.then(userInfo =>
  won.getOwnedNeedUris()
  .then(needUris =>
    Promise.all(
      needUris.map(needUri => won.getNeed(needUri))
    )
  )
  .then(needs =>
    dispatch(actionCreators.initialPageLoad({needs, userInfo}))
  )
)
.catch(error => handlePageLoadError(error))
```

This is already a lot conciser and more expressive. If an error occurs at any point the control-flow will jump to the next catch in the promise-chain and `Promise.all` ensures all needs finish loading before continuing. However, notice that the later access to `userInfo` requires nesting the Promises again.

Before the rework, the code-base was already, occasionally using Angular's `$q` as polyfill that was providing the same functionality in different places. However, as Angular-service, `$q` required to keep all code, even asynchronous utility-functions, within Angular-services.

#### Async-Await

While promises are a great way of managing asynchronicity in our code, async-await, a form of syntactic sugar for promises, allows further simplifications. The promise-based code-example from above ([@fig:promises-in-use]) can be written using async-await as follows:

```{.js #fig:async-await caption="Same example but using async-await"}
try {
  const userInfo = await won.login(credentials);
  const needUris = await won.getOwnedNeedUris();
  const needs = await Promise.all(
    needUris.map(needUri => won.getNeed(needUri))
  );
  dispatch(actionCreators.initialPageLoad({needs, userInfo}))
} catch (error) {
  handlePageLoadError(error);
}
```

This looks somewhat conciser and saves us the nesting caused by to the later use of `userInfo`. In this example this is a rather small difference, but the code-base had contained cases of up to five-layer deep nesting that were significantly simplified using async-await.

#### ES6-Modules and Bundling

Before using ES6-modules, we had been including the JS-files via `<script>`-tags in `index.html` which was very fragile as dependency information wasn't solely managed by the scripts themselves but also redundantly managed via this include list. Also, it depended heavily on Angular's dependency-injection mechanism, thus even utility-modules had to use that or expose themselves to global scope (and then be included in right order, lest they crash during startup). A less standardized variant here would have been to use the Asynchronous Module Definition [@WhyAMD] or CommonJS [@CommonJSNotes] syntaxes. A small caveat here, is that we still have to use the AngularJS dependency-injection mechanism, thus causing redundant dependency management, but now the duplication is contained in the same file (once as `import`-statement at the top of a view- or component-script and once in the AngularJS-module-declaration at the bottom).

As browsers can't directly load these modules, however, it is necessary to use a script that loads them on-demand at runtime, like SystemJS [@BedfordSystemJSDynamicES2018], or a bundler, that compiles all JavaScript-module together into a single JavaScript-file during the build-process. Such a bundle can then be included via a `<script>`-tag. We started off with the "JavasScript Package Manager" [@jspmioNative], short JSPM, that provides a convenient command-line-utility for installing packages (`jspm install npm:<pkgname>`) and handles the SystemJS-integration. Including it in a page is as simple as running `npm install jspm && jspm init` and adding the following to one's `index.html`:

```{.html #fig:systemjs-startup caption="SystemJS startup."}
<script src="jspm_packages/system.js"></script>
<script src="jspm_config.js"></script>
<script>
  System.import('app/app.js');
</script>
```

The downside of this approach is that every script file will be loaded separately and cross-compiled (see below in [section @sec:cross-compilation]), i.e. turning every page-load into a full build -- with a build-times of 1-5 minutes for a codebase with >16k lines of JavaScript and ~20 dependencies (translating into >800 indirect-dependencies, and -- more representatively -- 5MB of unminified and 1.5MB of minified code as of 2017/09^[Owner-webapp in September 2017: <https://github.com/researchstudio-sat/webofneeds/tree/69de16c1c7bc8495d915696665ae73b4dd1fd8f6/webofneeds/won-owner-webapp/src/main/webapp>]). <!-- TODO calculate all stats against this commit -->

A solution there, which is necessary for production anyway, is to bundle the modules into one JavaScript-file via `jspm bundle lib/main --inject`, by using `gulp-jspm` [@gulpjspm] in our Gulp-based build-setup (see [section @sec:gulp]) or the Webpack-build triggered via `npm build` in our latest Webpack-based build [see @sec:webpack]. Additionally, the resulting bundle was minified (e.g. by shortening variable names, dropping non-essential white-space-characters, etc). Together these reduced the all-important page-load times to -- still excessive -- 16 seconds on a simulated 3G connection [@Pageloadperformanceoptimisationa]. Further **page-load-optimizations** pushed this down to 4.5s (see [section @sec:page-load-optimizations])

#### Cross-compilation {#sec:cross-compilation}

During the build-process all JavaScript files are run through BabelJS, that converts all newer features, to equivalent but more verbose code, that supports older browsers. See the `.babelrc`-file for details on the configuration. Additionally, as not all features can be straight-out converted, a library providing some code that polyfills those features is added, i.e. adds them in the form of JavaScript where native implementation is lacking. 

### SCSS {#sec:scss}

Sassy CSS is a CSS pre-processor that allows features like:

- compile-time variables 
- nesting of style-blocks (that generate nested selectors)
- code-reuse via mixins/`@include` (that copy code) and `@extend` (that append css-selectors)
- modularization via `@import`
- conditionals
- mathematical expressions

During the build-process it gets converted to CSS.

### BEM {#sec:bem}

For the CSS-classes the naming convention BEM (short for "Block Element Modifier") was used that helps with avoiding name-collisions between css-classes in different components. It distinguishes between "blocks", i.e. stand-alone components, "elements" that only make sense within the context of a single block and "modifier" that model a sort of state of the block or element (e.g. "disabled"). The naming scheme for the class-names then looks as follows: `<block>((__<element>)*--<modifier>)*`, e.g. `won-button--disabled__icon` for styling the icon in a disabled `won-button`-custom-component/-tag, i.e. "block" in the BEM-sense.

### SVG-Spritemaps {#sec:svg-spritemap}

To optimize page-load, instead of having every small icon in a separate file, the build-process puts them all into a single big SVG with defined `<symbol>`-tags around the markup from each source file and generated IDs corresponding to their file names. These icons can then be used via an inline-SVG containing a `<use>`-tag, as can be seen in @fig:svgiconusage. Note that `xlink:href` and `href` would per se be redundant, but by declaring them both all browsers are supported.

```{.ttl #fig:svgiconusage caption="Usage of the icon placed in the file ico36person.svg. A color is set to the css-variable local-primary that can be used inside the SVG to enable icon-reuse."}
<svg class="…" style="--local-primary:var(--won-primary-color);">
    <use xlink:href="#ico36person" href="#ico36person"></use>
</svg>
```

Using the new Webpack build [see @sec:webpack], the SVGs are only included in the sprite-map when they are "imported" in any JavaScript-modules, in particular AngularJS-components. Also, in the SVGs the css-variables (most oftenly `--local-primary`) are used for colors, allowing to send the icon once and use it in multiple colors. Both of these enhancements further reduce the transmission-overhead.

### Gulp {#sec:gulp}

Gulp [@gulpjs; @gulp] is a build-tool that allowed us to define tasks for transpiling our JavaScript (using JSPM at the time) from ES6 ([@sec:es6]) to older versions, our SCSS ([@sec:scss]) to minified CSS, SVGs into a Sprite-Map ([@sec:svg-spritemap]) and copy around any static resources. It allows defining watch-tasks where file-changes to any of these trigger a corresponding rebuild, which makes development a lot smoother. However, it is been dropped out of the project by our recent switch from JSPM and Gulp to Webpack ([@sec:webpack]).

### Webpack {#sec:webpack}

Webpack is a bundler, that allows us to take all resources (in particular JavaScript-modules) in the project and put them in one file that can be fetched in a single server round-trip. The related build-config can be found in `webpack.config.ts`. Through a set of plugins other necessary build-steps, like JS and (S)CSS transpilation and minification are handled and SVGs required by any Angular-components marked for inclusion into the SVG-Spritemap (see @sec:svg-spritemap). A handy watch-task (the target for `npm watch`) ensures the bundle is rebuilt as soon as any resource changes.

### Other Page-Load Optmizations {#sec:page-load-optimizations}

Back in September 2017^[owner-webapp in September 2017: <https://github.com/researchstudio-sat/webofneeds/tree/69de16c1c7bc8495d915696665ae73b4dd1fd8f6/webofneeds/won-owner-webapp/src/main/webapp> (accessed 18.06.2018).] the code-bundle was 5MB of unminified and 1.5MB of minified code, which took 16 seconds on a simulated 3G connection [@Pageloadperformanceoptimisationa] to load. A set of small adjustements allowed to push this down to 4.5s:

- Minifying the CSS.
- Placing a `<link rel="preload" href="bundle.js">`-tag in the header to ensure bundle-loading starts before the `<body>`-HTML is parsed.
- Enabling `gzip`-compression on the server for all served files.
- Removing unused font-weights.
- Non-blocking font-loading by adding `font-display: swap;` to the `@font-face`-declarations. Fallback-fonts declared as part of the `font-family`-rules are displayed until the proper fonts have loaded.
- Using `woff`/`woff2` as font-format, as it is about a tenth of the size of `otf` and `ttf`-fonts.
- Making sure _all_ JavaScript dependencies are part of the bundle.

<!--
<https://github.com/researchstudio-sat/webofneeds/issues/546>

[Load data selectively](https://github.com/researchstudio-sat/webofneeds/issues/623) (#623) – Paging
-->

<!--

## Addressing the Design-Science Research Guidelines

### Design as an Artifact

"Design-science research must produce a viable artifact in the form of a construct, a model, a method, or an instantiation." This allows to demonstrate feasibility -- for cases where that wasn't a given yet -- thus making it research (as opposed to routine design).

%% This !%!

%%
@fkleedorfer: passt: es kam ja ein Artefakt heraus
 !%!

### Problem Relevance

"The objective of design-science research is to develop technology-based solutions to important and relevant business problems."

%% Relevancy here is with respect to a  "constituent community" (e.g. IS practitioners) !%!
%% TODO mention Technology Acceptance Model here (and need to define it)? i haven't really done anything based on it, so whatever !%!

%%
@fkleedorfer: passt: für WoN ist eine GUI wichtig
 !%!

### Design Evaluation

"The utility, quality, and efficacy of a design artifact must be rigorously demonstrated via well-executed evaluation methods."

%% This usually requires integration into the usage context (to see if it "works" there or is "good" in it), the definition of appropriate metrics and gathering of appropriate data. Evaluation provides valuable and necessary feedback for the design iterations (see [@fig:hevner]) !%!

%%
@fkleedorfer: passt: vielfältig evaluiert:
* andere Programmier.innen haben es verwendet
* User haben es ausprobiert
 !%!

### Research Contributions

"Effective design-science research must provide clear and verifiable contributions in the areas of the design artifact, design foundations, and/or design methodologies."

%% Important here is the novelty of the artifact -- by extending or innovatively (re-)applying previous knowledge -- as well as its generality and significance. !%!

%%
@fkleedorfer: muss bei einer Bak-arbeit nicht sein (war aber da)
 !%!

### Research Rigor

"Design-science research relies upon the application of rigorous methods in both the construction and evaluation of the design artifact."

%% This means applying existing foundations and methodologies, using effective metrics and formalizing. Note however, that an overemphasis on rigor can often lead to lower relevance (Lee 1999), as many environments and artifacts defy an excessive formalism (see "wicked problems" at footnote [^fn:wicked]). <! --TODO better reference / use glossary entry !%!

%%
@fkleedorfer: immer wieder durch andere Programmierer.innen angewandt, schließlich auch mit Usern getestet
 !%!

### Communication of Research

"Design-science research must be presented effectively both to technology-oriented as well as management-oriented audiences."

%%For the former the construction and evaluation process are important (e.g. to allow reproduction). For the latter the question boils down to "Is it worth the effort to use the artifact for my business?". This can be broken down as "What knowledge is required?" respectively "Who can use it?", "How imporant is the problem?", "How effective is the solution?" as well as some details in appendicesto appreciating the work. !%!

%%
@fkleedorfer:
* Dokumentation auf github
* diese Arbeit
* paper?
 !%! 

-->