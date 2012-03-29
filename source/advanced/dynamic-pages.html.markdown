---
title: Dynamic Pages
---

# Dynamic Pages

Middleman has the ability to generate pages which do not have a one-to-one relationship with their template files. What this means is that you can have a single template which generates multiple files based on variables. Here's an example `config.rb` setup:

    :::ruby
    ["tom", "dick", "harry"].each do |name|
      page "/about/#{name}.html", :proxy => "/about/template.html" do
        @person_name = name
      end
    end

When this project is built, four files will be output:

* /about/tom.html (with `@person_name` equalling "tom" in the template)
* /about/dick.html (with `@person_name` equalling "dick" in the template)
* /about/harry.html (with `@person_name` equalling "tom" in the template)
* /about/template.html (with `@person_name` being nil in the template)

In most cases, you will not want to generate the template itself without the @person_name variable, so you can tell Middleman to ignore it:

    :::ruby
    ["tom", "dick", "harry"].each do |name|
      page "/about/#{name}.html", :proxy => "/about/template.html", :ignore => true do
        @person_name = name
      end
    end

Now, only the `about/tom.html`, `about/dick.html` and `about/harry.html` files will be output.

## Arbitrary Ignores

It is also possible to ignore arbitrary paths when building a site using the new `ignore` method in your `config.rb`:

    ignore "/ignore-this-template.html"

You can give ignore exact source paths, filename globs, or regexes.