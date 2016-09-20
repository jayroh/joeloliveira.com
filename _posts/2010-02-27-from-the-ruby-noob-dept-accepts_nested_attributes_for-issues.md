---
title: 'From the Ruby Noob Dept: Issue(s) with <em>accepts_nested_attributes_for</em>'
author: Joel
layout: post
permalink: /2010/02/27/from-the-ruby-noob-dept-accepts_nested_attributes_for-issues/index.html
alias: /2010/02/27/from-the-ruby-noob-dept-accepts_nested_attributes_for-issues/from-the-ruby-noob-dept-accepts_nested_attributes_for-issues
categories:
  - Rails
  - Web Development
---

Finally took some time to jump in and refactor some nested forms at [Thredded][1] using Rails 2.3′s accepts\_nested\_attributes_for. Thanks to [Ryan Bates’ screencasts][2] on the topic it was fairly easy. A little code cleanup and everything worked as it should … other than *one thing*.

 [1]: http://thredded.com
 [2]: http://railscasts.com/episodes?search=nested forms

**Can’t mass-assign these protected attributes**

Noticed that error in my development logfiles after a particular form wasn’t being saved. A User class had some protected, and some not, attributes and until I added the Profile attributes to it, the nested form submitting a User and it’s associated Profile record would not save.

    class User < ActiveRecord::Base
      has_one  :profile
      accepts_nested_attributes_for :profile
      attr_accessible :login, :email, :password, :password_confirmation
      # ...
    end

Needed just the Profile attributes set as accessible and ready for mass assignment

    class User < ActiveRecord::Base
      has_one  :profile
      accepts_nested_attributes_for :profile
      attr_accessible :login, :email, :password, :password_confirmation, :profile_attributes
      # ...
    end

Another case where you need to know at all times where and if properties of your classes are locked down or not.
