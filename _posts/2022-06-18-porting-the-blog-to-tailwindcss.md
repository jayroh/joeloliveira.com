---
title: Porting the blog to TailwindCSS
category: code, jekyll, dev
author: Joel
layout: post
permalink: 2022/06/18/porting-the-blog-to-tailwindcss.html
alias: 2022/06/18/porting-the-blog-to-tailwindcss
intro: The one where this site gets pulled into this decade.
---

A couple weeks ago I noticed there were some style-related issues here, so I
reached for the css to make the necessary fixes. Easy enough.

But when I did so - I paused. And then realized I had no idea how to edit and
rebuild it(?). It had been a long, long, while.

> Side note: remember [Compass](http://compass-style.org/)? This website was using Compass! _I loved it!_
> Shout out to a real OG, author of compass and co-founder of Sass, [Chris Eppstein](https://twitter.com/chriseppstein).
> Absolute legend.
{: .pull-quote }

The small issue here was that, as it pertains to [Compass](http://compass-style.org/),
I just didn't recall the conventions around mix-ins, building, file locations,
etc. So, like every "good" (air-quotes) writer of software I decided to go the
long-way 'round and re-implement all of the styling with [TailwindCSS](https://tailwindcss.com/),
the current CSS _Belle of the Ball_.

Rough steps:

1. Stripped the site of any and all CSS-related code, assets, dependencies, etc.
2. Use the [jekyll-postcss-v2](https://github.com/bglw/jekyll-postcss-v2) plugin.
3. Installed with [their instructions](https://github.com/bglw/jekyll-postcss-v2#installation),
   _except_ for the npm dependencies, which they instruct that you install via
   `npm i -D postcss postcss-cli`. If you are using Netlify to build and deploy
   your website (as I do), then ***make sure to omit*** the `-D` because if and
   when you set `JEKYLL_ENV` to `production` then npm will not install whatever
   is inside the `devDependencies` key of your `package.json`.
4. Rewrite the old styles using the new framework. AKA, "[draw the rest of the owl](https://knowyourmeme.com/memes/how-to-draw-an-owl)"

The process was pretty straightforward and relatively painless if you run your
local Jekyll server with `jekyll serve --livereload`, and have your editor,
work in progress in one browser window, and your source/reference in another
browser. The [Tailwind docs workflow](https://www.packal.org/workflow/tailwind-docs-workflow-alfred)
for Alfred also came in handy for all of the documentation reference.

Finally, while doing this bit of work I took the opportunity to check the
blog's performance via [Lighthouse](https://developer.chrome.com/docs/lighthouse/overview/)
and made some further changes to improve its score. I'll add some details
related to that in a follow-up post.
