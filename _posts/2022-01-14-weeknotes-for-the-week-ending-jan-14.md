---
title: Weeknotes for the week ending Jan.14
category: weeknotes
author: Joel
layout: post
permalink: 2022/01/14/weeknotes-for-the-week-ending-jan-14.html
alias: 2022/01/14/weeknotes-for-the-week-ending-jan-14
---

![coffee good](/images/photos/coffee.jpg)

I've never taken a walk through knee-deep molasses before, but I have a feeling it's similar to the first week back at work after the new year. Glad that's over. As someone who was _not_ smart and did _not_ take the week between Christmas and New Year's off, the anxiety from the work you thought you would get done in that time, with the knowledge that people would be coming in with a fresh quarter of work to do, is palpable. Thankfully the majority of the work-force was operating under the same reality and eased into things.

In personal project news - I've spent most of my "tinkering" time with setting [Shubox] up with a new infrastructure, new provisioning, setup, and task automation. Improving my usage of [Ansible] has been a worthwhile endeavor -- doubling down with that on common tasks instead of dropping into a shell. A first go-round involved getting everything installed on "bare metal" (read: vps), whereas this time I've graduated to docker and docker-compose. Why? Try managing disparate installed versions of software on X machines, where operating system update v### introduces dependency hell. It's not fun. As much as Docker leaves an acrid taste in my mouth, I'll make do.

The newest and most interesting piece to all of the above is [Traefik]. When it works, it's wonderful! Getting it _to_ work, however, is something akin to [this].

What is it?

> Traefik is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. Traefik integrates with your existing infrastructure components (Docker, Swarm mode, Kubernetes, Marathon, Consul, Etcd, Rancher, Amazon ECS, ...) and configures itself automatically and dynamically.

..._"configures itself automatically and dynamically"_. Lol. Okay.

I hope to write more about it here in the near future, not out of altruism, but for (selfish) documentation purposes. The more time that passes between when I do "thing X" in Traefik and the next time I look at it, the more likely I have no goddamn clue what the actual hell is going on.

[Ansible]: https://www.ansible.com/
[Shubox]: https://shubox.io
[Traefik]: https://traefik.io
[this]: https://www.amazon.com/Beverly-Micro-White-Jigsaw-Puzzle/dp/B008DCQE3O

Misc
----

* Reading: [The enigmatic Portuguese "R"]. I would be surprised if anyone outside of BR-PT speakers, or linguists/glossophiles, would have an iota of interest in this, but - as one who (sort of) slots into the former and can appreciate the latter I loved this blog post. Specifically, the Brazilian Portuguese "R" is a fascinating case study in rhotics. It's so outside the realm of common usage in English that when I bump into the "Portuguese R" in the wild, I have to smile. (Tl;dr: the "R" down there is the "H" up here. "Rio" is pronounced "Hee-Oo" instead of "Ree-Oh").  The comments on [HN] are also pretty interesting.
* Listening: A "remembering" Fresh Air episode regarding [Joan Didion and Betty White]. Didion's one of those "I really should read some of her work" authors that I never get around to. This episode convinced me that this is probably the year I get to that.
* Also listening to: This ["Growing Up Punk" podcast with Matt Pryor of the Get Up Kids] where he shares stories of five of his favorite _GUK_ songs.
* Watching: The ["Dexter: New Blood"] finale. My opinion? [It was good]. The internet [disagrees].

[The enigmatic Portuguese "R"]: http://hackingportuguese.com/pronunciation/portuguese-r-the-long-version/
[HN]: https://news.ycombinator.com/item?id=29933671
[Joan Didion and Betty White]: https://www.npr.org/2022/01/07/1071268365/remembering-joan-didion-betty-white
["Growing Up Punk" podcast with Matt Pryor of the Get Up Kids]: https://www.growingpunkpod.com/podcast/episode/40915725/123-the-get-up-kids-with-matt-pryor-vocalsguitar
["Dexter: New Blood"]: https://www.independent.co.uk/arts-entertainment/tv/features/dexter-finale-new-blood-death-b1993272.html
[It was good]: https://twitter.com/jayroh/status/1480388149952102402
[disagrees]: https://twitter.com/foster8/status/1480389022446985218
