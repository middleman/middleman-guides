# The Development Cycle (middleman server)

The Middleman separates your development and production code from the start. This allows you to utilize a bevy of tools (such as [Haml](http://haml-lang.com), [Sass](http://sass-lang.com), [CoffeeScript](http://coffeescript.org/), etc.) during development that are unnecessary or undesirable in production.  We refer to these environments as The Development Cycle and the Static Site.

The vast majority of time spent using Middleman will be in the Development Cycle.

From the command-line, start the preview web-server from inside your project folder:

``` bash
cd my_project
bundle exec middleman server
```

This will start a local web server running at: `http://localhost:4567/`

You can create and edit files in the `source` folder and see the changes reflected on the preview web-server.

You can stop the preview server from the command-line using `CTRL-C`.

### Unadorned middleman command

Running `middleman` without any commands is the same as starting a server.

``` bash
bundle exec middleman
```

This will do exactly the same thing as `middleman server`.

# LiveReload

Middleman comes with an extension that will automatically refresh your browser whenever you edit files in your site. Simply open your `config.rb` and add

``` ruby
activate :livereload
```

Your browser will now reload changed pages automatically.

[HTML5 Boilerplate]: http://html5boilerplate.com/
[SMACSS]: http://smacss.com/
