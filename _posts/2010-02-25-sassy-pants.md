---
title: Sassy-pants
author: Joel
layout: post
permalink: /2010/02/25/sassy-pants
categories:
  - Web Development
---
# 

![][1]

 [1]: http://www.joeloliveira.com/wp-content/uploads/2010/02/sassy.jpg "sassy"

I’m pretty set in my ways professionally these days, so it’s hard sometimes to make a shift from what I’m comfortable with to a methodology that’s contrary to something that still works.

Like [CSS][2] – what the *what* needs to change in my work-flow regarding CSS at this point? I’m more than comfortable with box-models, browser hacks, sprites, peek-a-boo and double-float margin bugs. Waking up one day and thinking – “I could be better” was the kick in the pants to try something new. Enter [Sass][3].

 [2]: http://www.w3.org/Style/CSS/
 [3]: http://sass-lang.com/

> Sass is a meta-language on top of CSS that’s used to describe the style of a document cleanly and structurally, with more power than flat CSS allows. Sass both provides a simpler, more elegant syntax for CSS and implements various features that are useful for creating manageable stylesheets.

I won’t go into the syntactic sugar that makes Sass so much fun – [John Long][4] [[1][5]] [[2][6]] and [Adam Darowski][7] have already done excellent jobs rounding up the high, and lower, level concepts and tricks. I highly recommend visiting and bookmarking those links for future reference.

 [4]: http://wiseheartdesign.com/articles/2010/01/18/the-demise-of-css-why-sass-and-languages-like-it-will-triumph/
 [5]: http://wiseheartdesign.com/articles/2010/01/21/better-debugging-with-sass-and-line-comments/
 [6]: http://wiseheartdesign.com/articles/2010/01/22/structuring-a-sass-project/
 [7]: http://www.darowski.com/tracesofinspiration/2010/01/11/this-newbies-first-impressions-of-haml-and-sass/

A few things I’ve bumped into, however, that bear mentioning here involve a few tools and code snippets that I went looking for as I went down that sassy path. The first being [a Textmate bundle for sass][8] I found to help out during rapid and uninterrupted development. The syntax highlights are, of course, fantastic, but the killer feature is easily the quick CSS generation keyboard shortcut. Command-R will parse and generate your CSS file right there from inside Textmate. If there are any issues a tool-tip will pop up with the error. If you switch over and reload your browser too fast to see the tool-tip you’ll see an unstyled page – a big honking notice that you were doin’ it wrong. 

 [8]: http://github.com/adamstac/ruby-sass-tmbundle

The few bits of code, of many, that I needed to find, or create, quickly before getting down to business – Eric Meyer’s reset stylesheet, and maybe a mixin or two that I’m quick to use in a pinch – like *.clearfix*.

    // Reset
    
    html, body, div, span, applet, object, iframe,
    h1, h2, h3, h4, h5, h6, p, blockquote, pre,
    a, abbr, acronym, address, big, cite, code,
    del, dfn, em, font, img, ins, kbd, q, s, samp,
    small, strike, strong, sub, sup, tt, var,
    b, u, i, center,
    dl, dt, dd, ol, ul, li,
    fieldset, form, label, legend,
    table, caption, tbody, tfoot, thead, tr, th, td
      :margin 0
      :padding 0
      :border 0
      :outline 0
      :font-size 100%
      :vertical-align baseline
      :background transparent
    
    body
      :line-height 1
    
    ol, ul
      :list-style none
    
    blockquote, q
      :quotes none
    
    // remember to define focus styles!
    :focus 
      :outline 0
    
    ins
      :text-decoration none 
    // remember to highlight inserts somehow!
    
    del
      :text-decoration line-through
    
    table
      :border-collapse collapse
      :border-spacing 0
    
    // ----------- Clearfix --------------- 
    
    .clearfix
      *display:                 inline-block
      &#038;:after
        content:                " "
        display:                block
        height:                 0
        clear:                  both
        visibility:             hidden
     
    // ----------- Clearfix as mixin --------------- 
    
    =clearfix
      *display:                 inline-block
      &#038;:after
        content:                " "
        display:                block
        height:                 0
        clear:                  both
        visibility:             hidden

Those are two solid examples of how easy it is to just jump right in. So give it a shot – \`sudo gem install haml\` to install what you need, and get to work playing.
