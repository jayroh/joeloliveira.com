---
title: Debugging in Cucumber
author: Joel
layout: post
permalink: /2010/07/17/debugging-in-cucumber/index.html
alias: /2010/07/17/debugging-in-cucumber/debugging-in-cucumber
categories:
  - Web Development
---
# 

As a relative newb’ to [cucumber][1] I realize there’s a lot to get caught up on. The one thing I **do** know is that there’s a lot that I don’t know. Having said that, when I run into a barrier or an issue and I want to dig into the source to figure things out, what do you do?

 [1]: http://cukes.info

You break out *ruby-debug*, of course.

Add *require ‘ruby-debug’* to features/support/env.rb and throw a breakpoint into your step definitions.

That’s all well and good, and it works just fine. But what do you look for while you’re in there? I spent the better part of an evening looking for how I could sniff around the html source cucumber was testing against and couldn’t find it. Lots of searching for how to pear into @response and @request – which end up being nil as far as I can see. 

I had no idea.

Until I read [this post from the LoED][2] on how to test your source’s validity. In there was the answer:

 [2]: http://theled.co.uk/blog/archive/2010/07/17/how-we-added-automated-html-validation-to-our-web-development-process/

*page.body*

Eureka!

Baby steps. I’ll figure this all out yet.
