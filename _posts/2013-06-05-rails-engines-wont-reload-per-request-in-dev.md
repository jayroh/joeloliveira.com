---
title: Rails engines won't reload per request in dev
author: Joel
layout: post
permalink: /2013/06/05/rails-engines-wont-reload-per-request-in-dev/index.html
alias: /2013/06/05/rails-engines-wont-reload-per-request-in-dev
categories:
  - Rails
---

When working on a rails engine or plugin you might notice that, when running your dummy/test app in development mode, it will not reload any changes to your engine. If this is bothering you, then the solution is to add `config.reload_plugins = true` to your `spec/dummy/config/environments/development.rb` file. Restart your server and you should be able to reload your browser and see your changes take effect.

It's a small little thing but frustrating enough that you *might* think everything's busted.
