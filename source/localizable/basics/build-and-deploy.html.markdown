---
title: Build & Deploy
---

# Exporting the Static Site

## Building the site with `middleman build`

<br><iframe width="560" height="315" src="https://www.youtube.com/embed/S8b-aKlRdOs?rel=0" frameborder="0" allowfullscreen></iframe><br>

Finally, when you are ready to deliver static code or, in the case of "blog
mode", host a static blog, you will need to build the site. Using the
command-line, from the project folder, run `middleman build`:

```bash
$ cd my_project
$ bundle exec middleman build
```

This will create a static file for each file located in your `source` folder.
Template files will be compiled, static files will be copied and any enabled
build-time features (such as compression) will be executed. Middleman will
automatically clean out files from the build directory for you that are left
over from earlier builds but would no longer be produced.

To speed up the build time, you can expose the variable `NO_CONTRACTS=true`:

```bash
$ cd my_project
$ NO_CONTRACTS=true bundle exec middleman build
```

[Contracts] are used to add type signatures to certain methods, and Middleman
uses them to override and clear the gems' classes so no type checking is
performed - they're only used internally. For a more in depth description,
you can [watch a video explaining this behavior][youtube].

## Deploying the site

After building the site you have everything you need within the
`build`-directory. There are nearly limitless ways to deploy a static build. So
we present our very own solution for this here. Feel free to search the web or
look at our [extension directory] for more alternatives to deploy Middleman. If
you are an author of a deployment tool suitable to deploy Middleman, please
[open a pull request to the directory][directory].

A very handy tool to deploy a build is [`middleman-deploy`]. It can deploy a
site via rsync, FTP, SFTP, or Git.

```bash
$ middleman build [--clean]
$ middleman deploy [--build-before]
```

## Production Asset Hashing & CDN Configuration

A common setup for production is to hash your assets and serve them through a
CDN. You can do this easily with Middleman:

```ruby
configure :build do
  activate :minify_css
  activate :minify_javascript

  # Append a hash to asset urls (make sure to use the url helpers)
  activate :asset_hash

  activate :asset_host, :host => '//YOURDOMAIN.cloudfront.net'
end
```

  [extension directory]: https://directory.middlemanapp.com/#/extensions/deployment
  [directory]: https://github.com/middleman/middleman-directory
  [`middleman-deploy`]: https://github.com/middleman-contrib/middleman-deploy
  [youtube]: https://www.youtube.com/watch?v=W7qj_WFClls
  [contracts]: https://github.com/egonSchiele/contracts.ruby
