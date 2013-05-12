---
title: Meta descriptions and keywords for each page and post in WordPress
author: Joel
layout: post
permalink: /2009/04/03/meta-descriptions-and-keywords-for-each-page-and-post-in-wordpress/index.html
categories:
  - Web Development
  - Work
tags:
  - cms
  - meta
  - meta tags
  - wordpress
  - Work
---
# 

After searching for a plugin that might accommodate this in WordPress and coming up empty, I went digging for a possible easy way to do this with the means available.   Logic dictates that with custom fields this should be rather easy to accomplish.

The only snag might have been that in retreiving a custom field for a page or a post you need the page or post’s ID.   Usually this id is readily available within “the loop”, but what about when we’re up in the  tags?    A little searching in the codex reveals that we can grab your pages’ ID with **$wp_query->post->ID**.  Fantastic – because, with that we’re pretty much done! Adding the following in your theme’s header.php file between  …  :

> ” />  
> ” />

.. and “meta\_keywords” and “meta\_description” as custom fields with your desired content for each will get you to where you want to be.
