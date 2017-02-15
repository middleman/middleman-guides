---
title: Directory Structure
---

# Directory Structure

The default Middleman installation consists of a directory structure which looks like this:

```
mymiddlemansite/
+-- .gitignore
+-- Gemfile
+-- Gemfile.lock
+-- config.rb
+-- source
    +-- images
    ¦   +-- background.png
    ¦   +-- middleman.png
    +-- index.html.erb
    +-- javascripts
    ¦   +-- all.js
    +-- layouts
    ¦   +-- layout.erb
    +-- stylesheets
        +-- all.css
        +-- normalize.css
```

## Main Directories

Middleman makes use of the `source`, `build`, `data` and `lib` directories for
specific purposes. Each of these directories are children of the main Middleman
directory.

### Source Directory

The `source` directory contains your main website source files to be built,
including your templates JavaScript, CSS and images.

### Build Directory

The `build` directory is where your static website files will be compiled and
exported to.

### Data Directory

Local Data allows you to create `.yml`, `.yaml` or `.json` files in a folder
called `data` and makes this information available in your templates. The
`data` folder should be placed in the root of your project i.e. in the same
folder as your project's `source` folder. See the [Local
Data](/advanced/data_files/) docs for more information.

### Lib Directory

The `lib` directory enables you to include external Ruby modules which contain
[helpers](/basics/helper_methods/) for building your application. If you use Rails
then you will be familiar with this layout.
