---
title: External Pipeline
---

# External Pipeline

We are in the middle of an explosion of front-end languages and tooling. Since
the beginning, Middleman has defaulted to Rails' Asset Pipeline as our solution
for frontend dependency management and compilation.

In the past few years, the community has moved away from Rails and is now
focused on task runners ([gulp], [Grunt]), dependency management ([Browserify],
[webpack]) via npm, official tooling ([EmberCLI], [React Native]) and
transpilers ([ClojureScript], [Elm]).

Middleman cannot accommodate all these different solutions and languages, so
we've decided to allow all of them to live inside Middleman. This feature is
called `external_pipeline` and it allows Middleman to run multiple subprocesses
which output content to temporary folders which are then merged into the
Middleman sitemap.

## Ember Example

A simple Ember example looks like this:

```ruby
activate :external_pipeline,
  name: :ember,
  command: "cd test-app/ && ember #{build? ? :build : :serve} --environment #{config[:environment]}",
  source: "test-app/dist",
  latency: 2
```

This assumes that you have a `test-app` folder in your Middleman project which
contains the Ember frontend code. When in build mode, we tell Ember to do a
static build. When in dev, we get a dev build.

Ember compiles this information to the `test-app/dist` folder, who's contents we
merge into the Middleman sitemap.

## webpack Example

```ruby
activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: ".tmp/dist",
  latency: 1
```

## Broccoli Example

[Broccoli] is a powerful asset pipeline in the Node ecosystem. With a myriad of
plugins it can accommodate most pre-processing needs: CSS-languages (SCSS,
Compass), minification (UglifyJS et. al), module loaders, transpilation (Babel,
etc.) and much more.

`config.rb`

```ruby
activate :external_pipeline,
  :name => 'broccoli',
  :command => (build? ? 'broccoli build pipeline-build' : 'broccoli-timepiece pipeline-build'),
  :source => 'pipeline-build',
  :latency => 2
```

`Brocfile.js` (this can be expanded with Babel, SCSS and similar plugins)

```js
/* globals module,require,process */

var Funnel            = require('broccoli-funnel');
var mergeTrees        = require('broccoli-merge-trees');
var concatFiles       = require('broccoli-concat');
var uglifyJavaScript  = require('broccoli-uglify-js');

var env = process.env.BROCCOLI_ENV || 'production';

var SOURCE_DIR = 'assets';
var OUTPUT_DIR = 'res';

var VENDOR_JS = [
  'jquery-1.11.0.js',
];

var VENDOR_CSS = [
  'normalize-2.1.2.css',
];


// JavaScript
var jsVendorTree = concatFiles(SOURCE_DIR + '/vendor/js', {
  outputFile: 'vendor.js',
  headerFiles: VENDOR_JS,
});

var jsOurTree = new Funnel(SOURCE_DIR + '/js');

// merge vendor and our js
var jsTree = mergeTrees([jsVendorTree, jsOurTree]);

// concat vendor and our js
jsTree = concatFiles(jsTree, {
  outputFile: 'js/all.js',
  headerFiles: ['vendor.js'], // headerFiles are ordered
  inputFiles: ['**/*.js'], // inputFiles are un-ordered
  sourceMapConfig: { enabled: (env === 'development') },
});

if (env !== 'development') {
  jsTree = uglifyJavaScript(jsTree);
}


// CSS
var cssVendorTree = concatFiles(SOURCE_DIR + '/vendor/css', {
  outputFile: 'vendor.css',
  headerFiles: VENDOR_CSS,
});

var cssOurTree = new Funnel(SOURCE_DIR + '/css');

// merge vendor and our css
var cssTree = mergeTrees([cssVendorTree, cssOurTree]);

// concat vendor and our css
cssTree = concatFiles(cssTree, {
  outputFile: 'css/all.css',
  headerFiles: ['vendor.css'], // headerFiles are ordered
  inputFiles: ['**/*.css'], // inputFiles are un-ordered
  sourceMapConfig: { enabled: (env === 'development') },
});


// images
var imagesTree = new Funnel(SOURCE_DIR + '/images', {
  destDir: 'images',
});


// merge everything
var everythingTree = mergeTrees([jsTree, cssTree, imagesTree]);

var finalTree = new Funnel(everythingTree, {
  destDir: OUTPUT_DIR,
});

module.exports = finalTree;
```


`package.json`

```json
{
  "name": "assets",
  "version": "1.0.0",
  "description": "Website assets",
  "private": true,
  "engines": {
    "node": ">= 0.10.0"
  },
  "author": "Middleman Team",
  "devDependencies": {
    "babel-preset-es2015": "^6.18.0",
    "broccoli": "0.16.9",
    "broccoli-babel-transpiler": "5.5.0",
    "broccoli-concat": "^3.0.1",
    "broccoli-funnel": "1.0.3",
    "broccoli-merge-trees": "1.1.2",
    "broccoli-timepiece": "rwjblue/broccoli-timepiece",
    "broccoli-uglify-js": "0.2.0"
  }
}
```

  [gulp]: http://gulpjs.com/
  [Grunt]: https://gruntjs.com/
  [Browserify]: http://browserify.org/
  [webpack]: https://webpack.github.io/
  [EmberCLI]: https://ember-cli.com/
  [React Native]: https://facebook.github.io/react-native/
  [ClojureScript]: https://clojurescript.org/
  [Elm]: http://elm-lang.org/
  [Broccoli]: https://broccoli.build/
