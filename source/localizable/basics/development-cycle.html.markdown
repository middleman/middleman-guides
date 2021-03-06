---
title: The Development Cycle
---

# The Development Cycle

## Middleman Server

Middleman separates your development and production code from the start.
This allows you to utilize a bevy of tools (such as [Haml], [Sass],
[CoffeeScript], etc.) during development that are unnecessary or undesirable in
production. We refer to these environments as The Development Cycle and the
Static Site.

The vast majority of time spent using Middleman will be in the Development
Cycle.

From the command-line, start the preview web-server from inside your project
folder:

```bash
$ cd my_project
$ bundle exec middleman server
```

This will start a local web server running at: `http://localhost:4567/`

You can create and edit files in the `source` folder and see the changes
reflected on the preview web-server.

You can stop the preview server from the command-line using
<kbd>Ctrl</kbd> + <kbd>C</kbd>.

### Unadorned `middleman` command

Running `middleman` without any commands is the same as running
`middleman server`.

```bash
$ bundle exec middleman
```

## LiveReload

Middleman has an extension that will automatically refresh your browser
whenever you edit files in your site. First make sure that you have
`middleman-livereload` in your `Gemfile`. Then simply open your `config.rb` and
add:

```ruby
activate :livereload
```

Run `bundle install` to install the added `middleman-livereload` dependency.  
Your browser will now reload changed pages automatically.

### Reloading CSS

By default, Middleman will reload `stylesheets/all.css` when detecting a CSS
import was changed. Use `:livereload_css_target` option to set a different
target or `nil` to force a full page refresh.

  [Haml]: http://haml.info
  [Sass]: http://sass-lang.com
  [CoffeeScript]: http://coffeescript.org/
