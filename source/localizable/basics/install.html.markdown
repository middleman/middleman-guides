---
title: Installation
---

# Installation

Middleman is distributed using the RubyGems package manager. This means you will
need both the Ruby language runtime installed and RubyGems to begin using
Middleman.

<iframe width="560" height="315" src="https://www.youtube.com/embed/nNc5Pm4IYeE?rel=0" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/gayJFzi0rfg?rel=0" frameborder="0" allowfullscreen></iframe><br>

macOS comes prepackaged with both Ruby and RubyGems, however, some of the
Middleman's dependencies need to be compiled during installation and on macOS
that requires Xcode Command Line Tools. Xcode can be installed from the
terminal:

```bash
$ xcode-select --install
```

Once you have Ruby and RubyGems up and running, execute the following from the
command line:

```bash
$ gem install middleman
```

This will install Middleman, its dependencies and the command-line tools for
using Middleman.

The installation process will add one new command to your environment, with
three useful features:

```bash
$ middleman init
$ middleman server
$ middleman build
```

The uses of each of these commands will be covered in the next section,
[Start a New Site].

  [Start a New Site]: /basics/start-new-site
