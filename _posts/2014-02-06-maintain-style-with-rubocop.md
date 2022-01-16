---
title: Maintain Style with Rubocop
author: Joel
layout: post
permalink: /2014/02/06/maintain-style-with-rubocop.html
alias: /2014/02/06/maintain-style-with-rubocop
---

Have you heard of this [Rubocop](https://github.com/bbatsov/rubocop) yet? It's a static code analysis tool that enforces many of the guidelines outlined in the community [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide). Despite my initial hesitance &mdash; it felt a little "[cargo-cult'y](https://www.therailsway.com/2007/8/1/dangers-of-cargo-culting/)" &mdash; there are several reasons why I consider something like Rubocop valuable and fantastic.

As a development team grows the importance of keeping everyone moving in the same direction increases. The time spent discussing and commenting on pull-requests over innocuous details like trailing whitespace, tabs vs spaces, single vs double quotes, single line `{}` vs multi-line `do; end;` blocks. Over time it adds up. Why waste time when it can be automated?

It effectively helps remove a bit of human emotion from the code review process - the possibility that someone could misconstrue a litany of style-related comments in a pull-request as being personal. When someone gets hits with a few dozen "white-space" or "single quotes" comments in a PR, said person might consider it an exercise in nit-picking.

> *"This asshole is having a blast nit-picking my code"* ^1

This happens. Like it or not. We're human. We have feelings, however irrational they may be. Offloading this responsibility to a machine effectively takes this off the table. Nothing personal, right?

Last but certainly not least, even though I've been working with ruby for a long while, there are the occasional tidbits of style or best-practice that have fallen through the cracks - I had just not seen them. In going through the process of adjusting my own code these are bubbled up to the surface.

## Now for something practical

Having said that - here are a few tips on getting Rubocop into your codebase today! ^2

* Create a full Rubocop config with all of the "cops" set to false. Turn them on one by one and clean things up offense by offense. Running everything all at once may be overwhelming. Open up that YAML and start turning things on incrementally.

```bash
rubocop --auto-gen-config && mv rubocop-todo.yml .rubocop.yml
```

* Leverage your editor. There are plugins or extensions [for a number of editors at the project's repo](https://github.com/bbatsov/rubocop#editor-integration). I prefer a little more granular controller and added my own leader shortcuts.

```vim
" run rubocop through the entire project in my tmux window and pane of choice
map <leader>bc :call Send_to_Tmux("rubocop\n")<CR> 

" run rubocop on the current file in my tmux window and pane of choice
map <leader>bo :call Send_to_Tmux("rubocop ". expand('%:p') ."\n")<CR>
```

* After your codebase is in a clean state, pull it in with your other default rake tasks. After adding and bundling `rubocop` to your project, a hypothetical `Rakefile` with rspec and Rubocop as the default tasks could look like: 

```ruby
require File.expand_path('../config/application', __FILE__)
MyApp::Application.load_tasks

if %w(development test).include? Rails.env
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task(:default).clear
  task default: [:spec, :rubocop]
end
```

At this point you wouldn't have to think about running rubocop as it acts as a part of your test suite.

Last thought - it speaks volumes when a language adopts this idea as a core part of its feature-set. Just [look at Go](https://blog.golang.org/go-fmt-your-code). 

So what are you waiting for? Try it out and [let me know what you think](https://twitter.com/jayroh)!

* * *

^1 A worthwhile read regarding this - [you are not your code](https://sstephenson.us/posts/you-are-not-your-code).

^2 It may be a good idea to start by create a feature branch tackling *just* the task of cleaning up a single section of a codebase. Start with one bucket - like your models for example.
