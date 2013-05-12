---
title: Difference between :collection and :member in Rails 2.0
author: Joel
layout: post
permalink: /2008/08/11/difference-between-collection-and-member-in-rails-20/index.html
categories:
  - Site Work
  - Web Development
  - Work
tags:
  - development
  - enlightenment
  - rails
  - Work
---
# 

In getting up to speed with the new bells and whistles in Rails 2.0s RESTful routing capabilities I ran into something that puzzled me.  Of the options for a resource defined among your routes there were two similar pieces that, for one reason or another, I could just not find a solid and bulletproof explanation for – **:collection** and **:member**.  The :member part of it I got pretty easily for some reason, because its description is inherent in its own name … “a member among the default restful actions”.  The :collection part?  Notsomuch.  After some digging in the Rails mailing list I ran into a great, and worthy, explanation for this knucklehead by a contributer named “deegee”:

> For example, with map.resources :reviews, if you want to add a method ‘delete\_all’ that deletes all reviews at once. You may want to call that with ‘/reviews/delete\_all’ and method PUT (never use GET to delete something). This method is acting on all resources (a collection), so the route should be:
> 
> > **map.resources :reviews, :collection => { :delete_all => :put }**
> 
> If you want to have a custom action acting on a specific resource, e.g. ‘/reviews/3/give_rating’, then your action is on a member and the route would be
> 
> > **map.resources :reviews, :member => { :give_rating => :put }**

So that’s it! They’re the same other than :member working on a single resource, while :collection works on multiple.  DONE!

>
