---
published: !<tag:yaml.org,2002:js/undefined> ""
layout: default

---

---
title: Goodbye Wordpress
author: Joel
layout: post
permalink: /2013/05/26/goodbye-wordpress-hello-jekyll/index.html
categories:
  - Misc
  - Site Work
tags:
  - blog
  - jekyll
  - wordpress
---
#

Hello [Jekyll](http://jekyllrb.com/).

I'm behind the curve and moving my old neglected website to my new neglected website - *hopefully not?* - has, for a long while, been on the list of things to get to. The reasons why are too many to count, but at the core the wordpress experience is a terrible chore. Jekyll, once it's all set up and ready to go, moves into the background. It's an afterthought. I can now concentrate on writing - not updating it every few weeks, not learning a new UI every several point releases, not worrying about security vulnerabilities, and a complete lack of a WYSIWYG editor. Free at last!

This is the first time I've published a site with Jekyll so here are some tips and resources picked up through my brief journey:

1. [Ben Balter's wordpress to Jekyll exporter plugin](https://github.com/benbalter/wordpress-to-jekyll-exporter). I couldn't (wouldn't) have been able to move over the last several years' worth of embarrassing drivel to this without it.
2. The posts exported from that plugin are saved with permalinks *not* containing the trailing index.html. Jekyll will complain if that path doesn't contain a file. The following will run through the posts with sed and tack on the `index.html` to the end of your permalink: `find . -name \*.md -exec sed -i "" '/permalink/s|$|index.html|' {} \;`
3. As advertised, the [jekyll-s3 gem](https://github.com/laurilehmijoki/jekyll-s3) just works. Took me all of a minute to get things set up and my files uploaded to S3.
4. One bump I ran into had to do with using Amazon's cloudfront CDN in front of the S3 bucket. The root url for my domain, without `index.html`, displayed some sort of permission error. If I went directly to the cloudfront address it worked fine. After plenty of googling I gave up. S3 alone is fine enough for me right now.
5. If you're using GitHub pages then using [prose.io](http://prose.io) is a no-brainer. It hooks into github seamlessly and allows you to publish directly from the app. If all blogging platforms had UX half as good, the internet would be a better place.
6. If you like editing markdown locally then check out [Mou](http://mouapp.com/). It's my editor of choice. On the iPad I've enjoyed [Byword](http://bywordapp.com/), thanks to its integration with Dropbox.


Finally, I have to give credit where credit is due. If it weren't for my friend [Dan Pererra](https://twitter.com/dperrera)'s willingness to let me lift his markup and style for his own website, perrera.com/blog, then I don't think I would have made this move. It's clean, it's lovely, and, like Jekyll, it puts the content up front and center. Check out Dan's, and all his wonderful business partners', work at [the Outfit](http://fromtheoutfit.com/). They're all fantastic people (and great to raise a glass with). Thank you, Dan!
