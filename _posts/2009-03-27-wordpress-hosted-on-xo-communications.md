---
title: WordPress hosted on XO Communications.
author: Joel
layout: post
permalink: /2009/03/27/wordpress-hosted-on-xo-communications/index.html
alias: /2009/03/27/wordpress-hosted-on-xo-communications/wordpress-hosted-on-xo-communications
categories:
  - Web Development
  - Work
tags:
  - hacks
  - hosting
  - plugins
  - wordpress
  - XO
---

Suffice it to say – it’s not a winning combination.   There are two definitive hacks you’ll need to
get things to work.

First, [a plugin to disable canonical URL redirection][1].  Second, [a hack to wp-settings.php that
circumvents the XO php configuration’s not having *$\_SERVER['REQUEST\_URI']*][2].

 [1]: http://wordpress.org/support/topic/233098?replies=10
 [2]: http://wordpress.org/support/topic/194305?replies=6

**Update:** the second hack will break the non-admin part of the site in the context of the current
site I’ve been working on.  So your mileage may vary.
