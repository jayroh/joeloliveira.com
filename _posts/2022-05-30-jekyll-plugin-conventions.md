---
title: Jekyll Plugin Conventions
category: blog
author: Joel
layout: post
permalink: 2022/05/30/jekyll-plugin-conventions.html
alias: 2022/05/30/jekyll-plugin-conventions
intro: How the hell do these jekyll plugins work, anyway
photo: ./images/photos/jekyll-hyde.jpg
---

![jekyll logo](/images/jekyll.png)

When it comes to static-site generators Jekyll is clearly among the old heads
(if not the ***oldest***). I know it's not sexy. I know it's not shiny.

I don't care. 😄

It works, and it's easy to grok.

It's also pretty easy to extend its functionality with plugins – either on your
own, adding code to your website's code-base, or via rubygems. *Or* creating
your own plugin, and distributing it as a gem.

This post is for those getting to that last point. Just what does a typical
jekyll plugin look like? What are the typical conventions for file structure?
Naming? Any nuance?

## Common themes when writing Jekyll plugins

1. Jekyll plugins are often named via the kebab-case convention, instead of
   snake_case which is what you might see more commonly for general rubygems.
   This doesn't matter much as we can make it work. But if you're seeing a
   pattern within a community, then might as well follow the lead instead of
   bucking the trend. *"When in Rome"* and all that.

   Some example plugin gems in the wild:

   * [jekyll-loading-lazy](https://github.com/gildesmarais/jekyll-loading-lazy)
   * [jekyll-image-size](https://github.com/generalui/jekyll-image-size)
   * [jekyll-responsive-image](https://github.com/wildlyinaccurate/jekyll-responsive-image)

2. [Per the rubygems guides], there are recommendations for how you structure
   your files and class-names when you use certain naming conventions.

   ![chart with recommendations for how to name gems](/images/naming-gems.png)

   So, if you are naming your plugin "`jekyll-awesome-possum`" your file and
   directory structure would look like so:

   ```
   Gemfile
   Rakefile
   jekyll-awesome-possum.gemspec
   lib/jekyll-awesome-possum.rb
   lib/jekyll/awesome/possum.rb
   lib/jekyll/awesome/possum/**/*.rb
   ```

   Where your gemspec would potentially, probably, start out looking like:

   ```ruby
   # frozen_string_literal: true

   lib = File.expand_path('lib', __dir__)
   $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
   require 'jekyll-awesome-possum'

   # ...
   ```

   Note: There is a bit of unorthodoxy going on here that is worth pointing
   out. Normally the file `lib/jekyll-awesome-possum.rb` would not be necessary
   as ruby conventions would expect to auto-load code in
   `lib/jekyll/awesome/possum.rb`. Jekyll, however, does look to directly load
   that file and will complain if you do not have it:

   ```
   jekyll-4.2.1/lib/jekyll/external.rb:60:in `require': cannot load such file -- jekyll-imgproxy-tag (LoadError)
   ```

   Oops.

   Adding that file and further requiring the meat and potatoes of your code
   does the trick.

   `lib/jekyll-awesome-possum.rb`

   ```ruby
   # frozen_string_literal: true

   require 'jekyll/awesome/possum'
   ```

   [Per the rubygems guides]: https://guides.rubygems.org/name-your-gem/

3. What does your first class look like?

   `lib/jekyll/awesome/possum.rb`

   ```ruby
   require 'jekyll'

   module Jekyll
     module Awesome
       class Possum < Liquid::Tag
         VERSION = '0.1.0'

         def initialize(tag_name, markup, tokens)
           super
           @markup = markup
         end

         def render(_context)
           'Hello I am the output of a tag'
         end
       end
     end
   end

   Liquid::Template.register_tag('awesome_possum', Jekyll::Awesome::Possum)
   ```

   If you take a [look at the Jekyll source], you can see where the Jekyll team
   namespaces all of the project within a `Jekyll` module. As a result, we
   should do the same, otherwise an error will be raised due to the constants'
   names clashing. Otherwise, at this point we are pretty much free to flesh
   out the rest of our plugin as much as we would like.

For more information on how to author Jekyll plugins [visit the docs on their
site]. Additionally, [take a look at some of the other plugins out there] and
read through their source. There's nothing better than seeing the theoretical
applied in real life.

[look at the Jekyll source]: https://github.com/jekyll/jekyll/blob/master/lib/jekyll.rb#L42
[visit the docs on their site]: https://jekyllrb.com/docs/plugins/
[take a look at some of the other plugins out there]: https://github.com/planetjekyll/awesome-jekyll-plugins

Final thought – this blog post is a result of a little digging for these
conventions as I start writing a plugin to get tags generated for the [imgproxy]
image processing tool. If you look at [the source] and [the commit] for this
post you will see all of the above applied as I flesh out the skeleton of the
plugin.

{% imgproxy_url %}

[imgproxy]: https://imgproxy.net/
[the source]: https://github.com/jayroh/joeloliveira.com/
