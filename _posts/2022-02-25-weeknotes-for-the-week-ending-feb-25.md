---
title: Weeknotes for the week ending Feb.25
category: weeknotes
author: Joel
layout: post
permalink: 2022/02/25/weeknotes-for-the-week-ending-feb-25.html
alias: 2022/02/25/weeknotes-for-the-week-ending-feb-25
intro: The nerdy one about docker and firewalls
photo: ./images/photos/catching_snow.jpg
---


<figure class="photo-with-caption">
  <img src="/images/photos/catching_snow.jpg" width="609">
  <figcaption>
    Obligatory trip to our favorite neighborhood park to enjoy the fresh <strike>slush</strike> snow
  </figcaption>
</figure>

***

Did you know that Docker will automatically write firewall rules, using iptables,
so that whatever ports you expose to the host OS will be `allow`ed visibility out
to the world?

I didn't.

At least until this week.

It makes sense, I suppose? There's a lot going on under the hood between the OS
and network interfaces so making sure all of that plumbing is wired up sufficiently
is a sane assumption to make. All that being said, you'd think that `ufw deny <whatever port>` would supersede and take precedence over anything Docker was doing on its own. Such is not the case. After spinning up an instance of PostgreSQL on a test Linux box using docker, mapping the container's port to the host with:

```
ports:
  - "5432:5432"
```

... running `ufw deny 5432; ufw reload`, you might think that port `5432` would not be exposed to the world. If so, why would I be writing this? `:guy-tapping-head-meme:`

Turns out this is a common enough problem where cursory google searches return
[results like this].

> UFW is a popular iptables front end on Ubuntu that makes it easy to manage
> firewall rules. But when Docker is installed, Docker bypass the UFW rules and
> the published ports can be accessed from outside.

[results like this]: https://github.com/chaifeng/ufw-docker#problem

Luckily I remembered that there ***may*** be an easier way (**spoiler**: there is) and fixed my problem with the following -- why not bind to only the loopback interface: `localhost` aka `127.0.0.1`? A-HA! ☝️

Et voilà:

```
ports:
  - "127.0.0.1:5432:5432"
```

There you go. A port scan with nmap will now result in your postgres server no longer being exposed to the internet.

Let that be a lesson to you, kids. Always check your own shit, lest your weakly password'ed databases be prone to pwn.

Misc
----

* Listening: I hate that it's exclusive to Spotify but these days I imagine you're in the minority if you're not streaming over there. I digress. [This episode of "No Skips" about ***Ready to Die*** is outstanding](https://www.theringer.com/2021/12/16/22839599/the-notorious-b-i-g-ready-to-die). So much that I'd never taken a moment to notice, is dissected and pointed out and enumerated on. They say that the music you listen to as a teenager is what will stick with you for your entire life, and it's true. Something said about Juicy on this episode really struck me. That song has been played so much over the last 27+ years that it has no business being so listenable today. So many popular old songs get to the "ok that's enough. please, no more" stage ... but, Juicy? No. "Yeah. This album is dedicated to all the teachers that told me I'd never amount to nothin'" ... keep it going. Hall of fame track by the greatest to ever do it.
* Watching: **The Tourist**, a show out of Australia, by the BBC, with a Scottish lead. The premise is good (quite Memento'ish?) and the first few episodes deliver, but once everything is tied together it leaves a bit to be desired. I enjoyed it. Sara lost interest about 4 episodes in. Also watching **Inventing Anna** which is ... not my thing.
* **🇧🇷 Learning:** _"Vaso ruim não quebra"_. Literal translation: _"bad vases don't break"_. Meaning: _"that piece of shit guy will outlive us all"_. See: current world affairs. See, also: #45.
