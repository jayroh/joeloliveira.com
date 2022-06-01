---
title: Weeknotes for the week ending Mar.4
category: weeknotes
author: Joel
layout: post
permalink: 2022/03/04/weeknotes-for-the-week-ending-mar-4.html
alias: 2022/03/04/weeknotes-for-the-week-ending-mar-4
intro: The one about some software I used to obsess about
photo: ./images/photos/utah.jpg
---

<figure class="photo-with-caption">
  <picture>
    <source srcset="{% imgproxy_url path: "/images/photos/utah.jpg", resizing_type: 'fill', width: 1214, format: "avif" %}" type="image/avif">
    <source srcset="{% imgproxy_url path: "/images/photos/utah.jpg", resizing_type: 'fill', width: 1214, format: "webp" %}" type="image/webp">
    <img src="{% imgproxy_url path: "/images/photos/utah.jpg", resizing_type: 'fill', width: 1214 %}" alt="Me, somewhere in the middle of nowhere, Utah" width="607" height="455" loading="lazy" decoding="async">
  </picture>
  <figcaption>
    "Middle of nowhere" Utah, mid-x-country drive back to NE from San Diego - November 2001.
  </figcaption>
</figure>

***

I'm certain I've told this story before to many, many people. But I don't care - I'll tell it anyway.

Almost 21 years ago I was working at a small-ish web development agency (RIP Screenhouse) and the bottom was just about to start falling out from beneath the "dot com" industry. Easy come, easy go. Things started to dry up, and there were quite a few developers and designers just, kinda, twiddling their thumbs. Some folks got together and started designing and coding an internal intranet with hopes that maybe it could be sold, licensed out, etc. SaaS but ... pre-SaaS. That was alright, I guess? But I felt like doing something more fun. Remember, early-ish days of the internet -- pre-social media. So, of course, I started hacking together a messageboard with PHP and Mysql. It was an opportunity to try some new tech in a sandbox that my friends and I could mess around with/in.

Fast-forward 15, 16 years later and I had continued to work on it in some form or another - 2 rewrites in PHP, 3 rewrites in Ruby/Rails. By that time I slowed down, getting along in my career, started a family, having less time and enthusiasm for maintaining the code. I'd managed to extract the bulk of the code into an open source ruby gem and was relatively happy with where it was. So it was a fortunate turn of events that [Gleb], this brilliant engineer in London, got in touch with me and started contributing ([a LOT!]) to the codebase. Another guy, [Tim], also came along and helped push things to another level.

Which brings me to why I mention this now. This week Tim and Gleb got the [Thredded project](https://thredded.org) [to a 1.0 release](https://github.com/thredded/thredded/releases/tag/v1.0.0), which is a huge milestone considering the modest beginnings of the project. Twenty-one years after a very immature, very green, very stupid, kid started slinging awful PHP as a means to connect with his friends and act as a test-bed for learning new technology <a href="#to-1" name="from-1">1</a>

[Gleb]: https://github.com/glebm
[a LOT!]: https://github.com/thredded/thredded/graphs/contributors
[Tim]: https://github.com/timdiggins

I'm genuinely shocked that it's managed to kick around this long. As much as I am shocked, I am doubly thankful for the stewardship, care, and incredible work that Gleb and Tim have put into the project. I may have planted a seed 21 years ago, but the two of them have tended to, grown, the project into a remarkable _gem_ of a gem. It's way more their accomplishment at this point than it is mine.

So to the two of them -- Gleb and Tim, congratulations on shipping Thredded 1.0. Cheers 🥂

***

<a href="#from-1" name="to-1"><sup>1</sup></a>: In many ways I have that project, and the thousands of hours I spent on it, to thank for being the test-bed for the experimentation and learning that got me to where I am in my career today.
