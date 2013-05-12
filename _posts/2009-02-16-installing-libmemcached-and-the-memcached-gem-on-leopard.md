---
title: Installing libmemcached and the memcached gem on Leopard
author: Joel
layout: post
permalink: /2009/02/16/installing-libmemcached-and-the-memcached-gem-on-leopard/index.html
categories:
  - Web Development
  - Whining
  - Work
tags:
  - development
  - gem
  - memcached
  - rails
  - ruby on rails
  - Work
---
# 

![facepalm][1]What a huge pain in the ass.I just spent hours trying to get every combination of these two to work together and nothing worked.   A handful of versions of libmemcached had no problems installing – .24, .25 and .26 were all easy to install, both from source and from macports.  However, getting the memcached gem to install proved to be way way more difficult.I tried with a myriad of options – the most promising piece of information looked to be from [this gentleman’s website][2] – but also proved fruitless.The final solution, after a LOT of googling and clicking around the rubygem forums – [this post at Evan Weaver’s blog][3].  The libmemcached-0.25.14.tar.gz and memcached-0.13.gem tarball and gem, respectively, installed easily without any problems.  After downloading all I had to run was:  
>     tar -xzvf libmemcached-0.25.14.tar.gz
> 
>     cd libmemcached-0.25.14
> 
>     ./configure && make && sudo make install
> 
>     cd ..
> 
>     sudo gem install memcached --no-rdoc --no-ri

Done.Finally.**Update:**  There seems to be a few issues with the gem I link to being installed correctly in Snow Leopard.  After spending too much time trying to figure out why the gem wouldn’t install, I installed the current memcached gem (from gemcutter) on a whim – and it compiled, and worked, without a problem instantly.   So, if you’re running Snow Leopard and looking to install the memcached gem, try out the latest version first.One caveat – I’m still using the memcached server I linked to above, version  0.25.14, still from Evan Weaver’s site

 [1]: http://www.joeloliveira.com/wp-content/uploads/2009/02/facepalm.jpg
 [2]: http://shanesveller.com/2008/03/31/memcached-and-memcached-gem-on-leopard/#comment-18
 [3]: http://blog.evanweaver.com/articles/2009/01/24/secret-codes/
