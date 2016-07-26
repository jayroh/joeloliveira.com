---
title: Announcing Shubox.io
category: shubox
author: Joel
layout: post
permalink: /2016/01/06/announcing-shubox-io.html
---

I am legitimately *super* excited to share what I've been working on for these past few months.
[Shubox.io][] is a SaaS product that allows you to outsource all of your image and file uploads,
directly to S3 - never touching your app-servers, process/resize/convert your images, and provide
you the file data back, via webhooks, for all of your uploads.

While accepting file uploads is no longer the tedious and arduous process it was years ago, it's a
process that can quickly and easily balloon to a non-trivial endeavor and touch many levels of your
application stack. This is why I'm building [shubox.io][]. It's a facet of the web-stack that I
believe can have the boilerplate abstracted, the busy-work automated, and the repetitive work
outsourced.

Now don't get me wrong, this task&mdash;uploading and processing files&mdash;*is* managable. There
are plenty of tools that abstract this issue out. But when you've tackled this issue several dozen
times, and would rather not work through the same boilerplate, that's when it's time to look
for a more robust and managed solution.

Do you host your app on a platform like [Heroku][]? File uploads on [Heroku][] provide particular set of
hoops you will now have to jump through.

Do you often accept dozens to hundreds of files? I hope your app server and stack can handle files
tying up your resources (depending on your framework of choice, of course).

If you're ambitious, you may have tried to upload your files directly from your browser to S3. Have
you tried? It's not entirely straightforward.

These are a few use cases where it's not terribly difficult, but when an application feature set
grows past a certain point, [shubox.io][] is here to help remove those pain points.

I'm really excited to announce [shubox.io][] as the various aspects of its feature set have been a
large part of my own personal development toolbox since I started writing code 17 years ago. File
uploads are going nowhere, so [shubox.io][] is here to make it an easier, better experience.

I should state that this is very much a beta for now as I'd love to get some feedback from anyone
who would like to use it now, or soon *if* "feature X" is something most people would want out of
the box. So, if you'd like to know more, or be comped a few domains to test with, please do sign up
for the newsletter, follow [@shuboxio][], or [me][], on twitter, or <span class="email-me">email me
directly</span>. I'd *love* to hear your thoughts on what you'd like to see provided by a service
like [shubox.io][].

[Shubox.io]: https://shubox.io
[shubox.io]: https://shubox.io
[Heroku]: https://www.heroku.com/
[@shuboxio]: https://twitter.com/shuboxio
[me]: https://twitter.com/jayroh