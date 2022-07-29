---
title: Weeknotes for the week ending Jul.29
category: weeknotes
author: Joel
layout: post
permalink: 2022/07/29/weeknotes-for-the-week-ending-jul-29.html
alias: 2022/07/29/weeknotes-for-the-week-ending-jul-29
intro: Whether self-hosting has been working for me, and why?
photo: ./images/photos/metaphor-about-something-or-other.jpg
---

<figure class="photo-with-caption">
  <picture>
    <source srcset="{% imgproxy_url path: "/images/photos/metaphor-about-something-or-other.jpg", resizing_type: 'fill', width: 1344 %}"
      media="(min-width: 413px)" />
    <img src="{% imgproxy_url path: "/images/photos/metaphor-about-something-or-other.jpg", resizing_type: 'fill', width: 738 %}"
      alt="An empty cardboard box on the sidewalk with 'free' hastily written on the side"
      width="369"
      height="208" />
  </picture>

  <figcaption>
    You know the saying - "Nothing in life is free"
  </figcaption>
</figure>

A year or so ago I bought a Synology NAS and started to consolidate some of the disparate cloud storage services
into one single physical box that I knew I could (theoretically) control myself. It worked out well. I liked it!
I could install some packages, I could run Plex, I could back up docs, photos, mp3's, movies, etc.

Then I started branching out a little bit and messing around with using docker to host some services that didn't
already have Synology-related package installers. With docker-compose, this was all pretty straightforward and
didn't give me too much headache.

Over time this has grown into a full-on "homelab" situation where I've migrated most services onto a small Dell server
that sits in the corner of my office plugged into a UPS. Ultimately this has turned into the sweet spot and I am
thrilled with the workflow. It looks a little something like this:

1. Does this service I pay for (Dropbox) have a decent alternative? Is there a docker image? Give it a shot.
2. Does this service which I DON'T pay for but serve as data points for a machine-learning algorithm (Google Anything) have a decent alternative? Is there a docker image? Give it a shot.
3. Does something look cool on [/r/selfhosted](https://www.reddit.com/r/selfhosted) that I want to try? Is there a docker image (almost 100% of the time: "Yes")? Give it a shot.

Pretty easy.

So what has been good for me?

1. [Dashy](https://dashy.to/) - A dashboard that serves as my homepage. Links to all of my self-hosted services, in their logical groups, go here.
1. [Nginx Proxy Manager](https://nginxproxymanager.com/) - An nginx configuration front-end. Makes setting up services and LestEncrypt certs a cynch.
1. [Linkding](https://github.com/sissbruecker/linkding) - Bookmarking app a la "Pinboard" and "Del.icio.us"
1. [Whoogle](https://github.com/benbusby/whoogle-search) - "A self-hosted, ad-free, privacy-respecting metasearch engine ", AKA "Google front-end". No google ads. No tracking.
1. [Umami](https://umami.is) - A privacy-focused website analytics package. No more Google Analytics for me.
1. [AdGuard](https://adguard.com/en/welcome.html) &amp; [Pi-Hole](https://pi-hole.net/) - Both! DNS servers for local, in-house, ad blocking.

This is the tip of the iceberg. There are more, but these are good starts.

If you're in the "tech" business you can imagine this is a potentially dangerous hole to drop down into. I
recognize this, but there's not a chance in hell I end up like the people in [/r/homelab](https://www.reddit.com/r/homelab/comments/pvneu2/im_the_guy_with_the_scorpion_rack_figured_id_post/).

Knock on wood.

