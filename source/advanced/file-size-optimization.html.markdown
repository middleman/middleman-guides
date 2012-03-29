---
title: File Size Optimization
---

# File Size Optimization

## Compressing CSS and JavaScript

Middleman handles CSS minification and Javascript compression so you don't have to worry about it. Most libraries ship minified and compressed versions of their files for users to deploy, but these files are unreadable or editable. Middleman allows you to keep the original, commented files in our project so you can easily read them and edit them if needed. Then, when you build the project, Middleman will handle all the optimization for you.

In your `config.rb`, activate the `minify_css` and `minify_javascript` features during the build of your site.

    :::ruby
    configure :build do
      activate :minify_css
      activate :minify_javascript
    end
    
If you are already using a compressed file that includes `.min` in its filename, Middleman won't touch it. This can be good for libraries like jQuery which are carefully compressed by their authors ahead of time.

You can customize how the JavaScript compressor works by setting the `:js_compressor` option in `config.rb` to a custom instance of Uglifier. See (Uglifier's docs)[https://github.com/lautis/uglifier] for details. For example, you could enable unsafe optimizations and mangle top-level variable names like this:

    :::ruby
    set :js_compressor, Uglifier.new(:toplevel => true, :unsafe => true)

## GZIP text files

It's a good idea to [serve compressed files](http://developer.yahoo.com/performance/rules.html#gzip) to user agents that can handle it. Many web servers have the ability to gzip files on the fly, but that requires CPU work every time the file is served, and as a result most servers don't perform the maximum compression. Middleman can produce gripped versions of your HTML, CSS, and JavaScript alongside your regular files, and you can instruct your web server to serve those pre-gzipped files directly. First, enable the `:gzip` extension:

    :::ruby
    activate :gzip

Then configure your server to serve those files. If you use Nginx, check out [the gzip_static](http://wiki.nginx.org/NginxHttpGzipStaticModule) module. For Apache, you'll have to do something a little trickier - see [this Gist](https://gist.github.com/2200790) for an example.

## Compressing Images

If you also want to compress images on build, you can use the [Middleman Smusher extension] to dramatically shrink images using [Yahoo's Smush.it tool], though it's probably a better idea to compress your images once using a tool like [PNGGauntlet](http://pnggauntlet.com) or [ImageOptim](http://imageoptim.pornel.net) rather than every time you build your site.

To install:

    :::bash
    gem install middleman-smusher

Then activate in your `config.rb`:

    :::ruby
    configure :build do
      activate :smusher
    end

 

[Middleman Smusher extension]: https://github.com/middleman/middleman-smusher
[Yahoo's Smush.it tool]: http://www.smushit.com/ysmush.it/