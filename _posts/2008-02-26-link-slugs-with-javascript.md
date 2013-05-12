---
title: Link Slugs with Javascript
author: Joel
layout: post
permalink: /2008/02/26/link-slugs-with-javascript
categories:
  - Misc
  - Site Work
  - Web Development
  - Work
tags:
  - javascript
  - rails
  - ruby
  - seo
---
# 

Over at [Thredded][1] I am still using Rails 1.2.3 (I’m a little gun-shy to upgrade to 2.0) and, of course, felt that slugged links were necessary for both search engine optimization and making things like assessing site analytics a little easier. It doesn’t even need justification as it’s a matter of fact and necessity for any and all social platforms – blogging, forums, etc. With RoR 1.2.3 the best way to get your links *slugging* it out was to incorporate a plugin like [acts\_as\_sluggable][2]. It works like a charm, really, and I’ve never had any case where I needed extra functionality.

 [1]: http://thredded.com
 [2]: http://tore.darell.no/pages/acts_as_sluggable

… Until now. I’ve started incorporating some auto-updating magic to Thredded and needed to grab a lot of data back from an AJAX call (sorry Steve – **XHR**) in the form of JSON. All well and good so far. But, when new links needed to be built on the client side, I didn’t have my handy built-in Rails ActiveRecord overrides to spit out my new slugged-up link! What to do?!

I dug through the plugin source and found the function that built the url’s slug -

    def make_slug(string)
          string.to_s.downcase.gsub(/[^a-z0-9] /, '-').gsub(/- $/, '').gsub(/^- $/, '')
    end

… And thought the quickest solution was just to rewrite it as a simple JS function.

    function slug(id, title)
    {
          title = title.toLowerCase().replace(/[^a-z0-9] /g,'-').replace(/- $/g,'').replace(/^- $/g,'');
          return(id '-' title);
    }
