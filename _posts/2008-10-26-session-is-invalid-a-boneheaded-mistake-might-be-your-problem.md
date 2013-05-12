---
title: 'Session is Invalid &#8211; A Boneheaded Mistake Might be Your Problem'
author: Joel
layout: post
permalink: /2008/10/26/session-is-invalid-a-boneheaded-mistake-might-be-your-problem/index.html
categories:
  - Uncategorized
tags:
  - cookies
  - error
  - memcached
  - rails
---
# 

Here’s something I lost hours to thanks to my own boneheaded mistake (I think I might have “lack of sleep” to blame for this one – in conjunction with ignorance).

I changed my Rails app to use memcached as the caching store for obvious reasons.  Some sql queries are just too expensive so why keep hitting the damn db over and over again? Here comes memcached to the rescue!  … or not?

I made all the appropriate changes, installed memcache-client, and restarted my local dev environment only to be hit with an ugly

> session_id “whole lots of letters and numbers blarghedy blargh” is invalid

With the last file in the stacktrace being mem\_cache\_store.rb.   “What the hell?  Everything **looks good** though!”After uninstalling any and every plugin that I didn’t need thinking maybe they were interfering with the cache store – newrelic\_rpm,  query\_reviewer and of course cache_fu – the problem remained. I reverted to regular built in filesystem caching and another error shows up – something about a cookie being tampered with.

\*Ding\*

Where the hell is the session id stored?  Of course it’s in a cookie.  After bringing up firebug and deleting the cookie (or conversely probably just restarting the browser) the problem was gone.

My fatal flaws?  I overwrote the ***config.action_controller.session :secret*** I had originally in development.rb with a new one in environment.rb and I didn’t restart my browser or delete that session cookie.

Ain’t that a bitch?
