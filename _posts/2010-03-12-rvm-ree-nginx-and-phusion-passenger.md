---
title: rvm, ree, nginx and phusion passenger
author: Joel
layout: post
permalink: /2010/03/12/rvm-ree-nginx-and-phusion-passenger/index.html
categories:
  - Web Development
---
# 

A production web / application server that I maintain has been around for mostly wordpress and static sites we host for some of our clients. Soon, however, the need for some Rails-based client sites will be popping up for us over there. Traditionally the set-up for those apps have been in clients’ own hosting environments, or were apps I hosted in a dedicated app-server slice of my own. So, the need crept up, and now I’m left planning for now, and the future. And what is that future, you might ask (ok, probably not)? Rails 3, of course. 

The baseline reference implementation for Rails 3, as I know it, is 1.8.7, but has been tested to work with Ruby 1.9, and also functions properly with Phusion’s Ruby Enterprise Edition (henceforth known as REE). To say that Ruby is in a transition phase is an understatement. The community has been hard at work trying to get gems, frameworks, their associated plugins, etc, to work with all of the new shiny ruby-based toys. In order to accurately test, the RVM project has stepped up as the solution for testing and developing across multiple Ruby interpreters. 

New server setup, quickly moving innovation, growth and change … all of these point me in one direction – drinking the RVM kool-aid and getting right into it. But not without a few hiccups. Here are my steps in getting things rolling with rvm, nginx, ree and passenger.

**Note:** Don’t install nginx at first thinking that passenger will end up being installed as a plugin, or module. I wasted some time in doing that. When you go through the process of installing passenger it’ll ask to compile and re-install nginx. So we’ll get to that eventually.

To get everything compiling as I wanted I had to install a handful of obvious, and not-so-obvious, packages and libraries. To wit: 

> sudo apt-get install ruby-full build-essential curl libpcre3 libpcre3-dev libpcrecpp0 libssl-dev zlib1g-dev libgcrypt11 libgcrypt11-dev bison libreadline5-dev

Your mileage may vary.

Also, the irony doesn’t escape me that we needed to install ruby, “ruby-full”, in order to install a bunch of other rubies. But hey, whatever.

**Install rvm**. It’s as easy as [following the instructions at the RVM site][1]. I chose to go the gem route. Follow the instructions as are given and things will be fine. The only hiccups I had involved some libraries that are taken care of in the above package installs.

 [1]: http://rvm.beginrescueend.com/rvm/install/

**Install the versions of ruby you’d like**. *rvm install 1.8.6,1.8.7-head,ree,1.9.1*

According to fellow boston.rb’ist @[techiferous][2] we use 1.8.7-head, because

 [2]: http://twitter.com/techiferous

> [#][3] Rails 3 needs Ruby 1.8.7. Use rvm to manage Ruby versions. Do “rvm ruby-1.8.7-head” NOT ruby-1.8.7-p249 (broken gems).

 [3]: http://twitter.com/techiferous/status/8751925362

After some time compiling and wrangling everything together you should have a handful of different rubies at your disposal. Please visit the rvm site for examples, use cases and general information. It’s worth your time. 

At this point I switched to ruby-ree in preparation of the passenger and nginx install. *rvm ree*. A quick *ruby –version* now tells us that we’re running *ruby 1.8.7 (2009-12-24 patchlevel 248) [x86_64-linux], MBARI 0×6770, Ruby Enterprise Edition 2010.01*. 

**Install Passenger and Nginx**. *gem install passenger && rvmsudo passenger-install-nginx-module* will get you started. Here’s where the install of Nginx goes down, as noted in the text after you run the command: 

> Nginx doesn’t support loadable modules such as some other web servers do,  
> so in order to install Nginx with Passenger support, it must be recompiled.

I chose to customize my own install and selected the second option. Do whatever you’re most comfortable with. I prefer to have my compiled source in /opt/local, but again, it’s all a matter of preference. After some more compiling, we were all done and have a newly compiled install of Nginx, with Passenger, Utilizing the REE ruby interpreter.

Last but not least, go thank [Wayne Seguin][4] for the work on RVM. Amazing work!

 [4]: http://twitter.com/wayneeseguin
