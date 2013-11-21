A Puppet module for managing the installation of
[Graphite](http://graphite.wikidot.com/).

[![Build
Status](https://secure.travis-ci.org/garethr/garethr-graphite.png)](http://travis-ci.org/garethr/garethr-graphite)

# Usage

Nice and simple, mainly because it's not yet very configurable.

    include graphite

## Configuration

If you want to run the web interface on a port other than 80 you can
pass this in like so:

    class { 'graphite':
      port => 9000,
    }

This modules will install Python and the ensure the relevant python
dependencies are available. If you would rather not have this module
manage python then you can disable this feature like so:

    class { 'graphite':
      manage_python = false,
    }

## Another Graphite module?

Graphite can be painfull to install and many blog posts and gists are
dedicated to that fact. However it appears to have got easier with most
of the components now available in the Python Package repository. All
the other puppet modules I found either lacked support for
Ubuntu/Debian, relied on an undocumented package or did a lot of
wgetting. 

Although I've only tested this module on Ubuntu it should work on other
distros too, maybe with minor tweaks.
