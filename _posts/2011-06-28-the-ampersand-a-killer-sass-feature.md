---
title: 'The ampersand &#038; a killer Sass feature'
author: Joel
layout: post
permalink: /2011/06/28/the-ampersand-a-killer-sass-feature/index.html
alias: /2011/06/28/the-ampersand-a-killer-sass-feature/the-ampersand-a-killer-sass-feature
categories:
  - Sass
  - Web Development
---
# 

Earlier tonight [Adam Stacoviak][1] posted [something on his blog][2] about the killer feature that is the ampersand in the Sass CSS meta-language. Go read it immediately. Go. I’ll wait here.

 [1]: http://twitter.com/adamstac
 [2]: http://adamstacoviak.com/posts/referencing-parent-selectors/

So – to boil this down … the *“&”* tells sass to pull the entire parent selector into where you place this beautiful little ampersand. The perfect use case that allowed me to dip my toes into this was with something like psuedo selectors for anchor tags. Example: 

<script src="https://gist.github.com/1052807.js?file=ampersand-to-start.css"></script>

Simple enough, right? Pretty awesome. As Adam noted in his blog post though, the *&* doesn’t belong solely at the beginning of your nested selector – you can tack it on at the end of that nested selector for further customization. Let’s say the example I have above needs a special edge-case for a particular page, or page state — like what if I’m logged in as an admin? Maybe our page(s) have a new “admin” class added to our body tag? We could go the route of adding something after our scss block specifying this edge case.

<script src="https://gist.github.com/1052807.js?file=ampersand-can-go-wherever-pt1.css"></script>

But why? Why bump this down below as almost an afterthought? Shouldn’t we have that grouped inside within the context of the anchor tag? We can do that with the magical ampersand:

<script src="https://gist.github.com/1052807.js?file=ampersand-can-go-anywhere-pt2.css"></script>

Pay attention to where that ampersand is. “Pre-pend this *body.admin* right before **all** of the parent selectors in this nested group”.

Now. Here’s where I hope to stress just how money this is. Because it is.

Have you used [Modernizr][3]? What about the [google web-font loader][4]? At the very least you’ve used [the trick from HTML5 Boilerplate to target versions of IE with some well-placed conditional comments][5]? What do all of these have in common? They all dynamically, in one form or another, add classes to the root html class. In Modernizr’s case it tells you what features you can hook into within your CSS. In Google’s web-font loader it will update some classes in  to tell us if and when our typefaces *are loading* or *have loaded*. This is where that ampersand has made things easier for me. 
A perfect real world example to consider is when I was working on starting to integrate [Quicksand][6], a free font from FontSquirrel, with Google’s Web-font loader, into the very much in-progress [Design*Sponge][7] redesign. I fell into a trap where I ended up tacking selectors onto a tragically long list for two states of the font – NOT loaded, and loaded. Not familiar? Let me explain. 

The element that needed styling to use Quicksand was always set to *visibility: hidden*. Once the font(s) finished loading the html would end up with the .wf-active class, allowing us to then show the font(s) with *visibility: visible*. This is all to combat [FOUT (“flash of unstyled text”)][8]. The tragedy was how I chose to tackle this at first – I had that previously mentioned LONG list of selectors, comma separated, that kept getting new elements whenever a new piece of text needed “QuicksandLight”. Poor decision. That CSS got unruly and terribly difficult to manage. I had sass partials containing beautifully compartmentalized and scoped selectors …

![no, it's not okay][9] 

… and then this giant blob of garbage saying “these are hidden” … “until they get .wf-active” in the html tag. 

Not ok. This needed to be dealt with. These edge-cases needed to show up right after the “normal” base selectors, not in a disparate location somewhere else in the CSS. I determined that the best solution would be to wrap these fonts and the associated states in mixins that could be used across our scss files. Here’s what I came up with: 

<script src="https://gist.github.com/1052807.js?file=quicksand-mixin.css"></script>

At first glance it doesn’t look like such a big deal, but when you consider there are hundreds of elements on the site getting this font-face applied to it, it ends up turning into a chore mostly consisting of a **lot** of copy and paste. Really study that gist – when that clicked, it was magic. 

As a bonus, consider this – originally I didn’t realize I needed to target IE as I did in the final resulting mixin. The site launched without *.msie.wf-loading* and *.msie.wf-inactive* in there. Without that treatment the fonts were not showing up in IE7 and IE8. Terrible. After a little research I ended up adding those two into the mixin and all was good in the world. No global search. No copy and paste needed. Run into that problem without using something like Sass, just plain vanilla css, and tell me you’re not annoyed. I promise you – you’re annoyed.

That’s but one example using the Google font-loader. Using this in conjunction with the conditionally set IE-related classes, or a CSS3 feature like “borderimage” (which I used the hell out of for Design*Sponge), has been a god-send. Keeping everything tidy inside the scope of our nested selectors keeps things manageable and easy to find. There’s no need to go searching for similar selectors across your CSS file – because it’s right *there*, *right next* to your normal, base selector.

 [3]: http://www.modernizr.com/
 [4]: http://code.google.com/apis/webfonts/docs/webfont_loader.html
 [5]: http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/
 [6]: http://www.fontsquirrel.com/fonts/Quicksand
 [7]: http://www.designsponge.com/
 [8]: http://paulirish.com/2009/fighting-the-font-face-fout/
 [9]: http://s3.amazonaws.com/kym-assets/entries/icons/original/000/005/627/untitled.JPG "not ok"
