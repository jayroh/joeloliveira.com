---
title: 'Using Google Apps Email as Your App&#8217;s SMTP Server'
author: Joel
layout: post
permalink: /2009/04/27/using-google-apps-email-as-your-apps-smtp-server/index.html
alias: /2009/04/27/using-google-apps-email-as-your-apps-smtp-server/using-google-apps-email-as-your-apps-smtp-server
categories:
  - internet
  - Site Work
  - Web Development
tags:
  - email
  - gmail
  - google
  - rails
  - ruby
  - smtp
---

Something I’ve held out on for a while now has been to switch over the settings for ActionMailer in
my application(s) to point to my hosted Google apps account.   I figured it was probably time to do
so as piping email notifications through my comcast email account is generally, probably, a bad idea
(courtesy of the “No Duh” department).

Seems like it should be rather easy, no?  Just change action mailer to resemble:

```ruby
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "hosteddomain.com",
  :authentication => :plain,
  :user_name => "account@hosteddomain.com",
  :password => "omgsup3rsecret"
}
```

Meh. Looks easy enough, right? Except for the fact Google’s got some magic TLS authentication thing
going on – you’ll run into an error in your mailers resembling *Must issue a STARTTLS command
first.*. Enough to make you work a little harder to get the magic working.

For those of you/us that are running Ruby 1.8.7 and Rails 2.3.x the answer is rather simple – add
*:enable\_starttls\_auto => true* to your smtp settings, which will result in :

```ruby
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "hosteddomain.com",
  :authentication => :plain,
  :user_name => "account@hosteddomain.com",
  :password => "omgsup3rsecret"
}
```

And for the rest of you/us (that would be me) that are still sticking with Ruby 1.8.6, there is an
answer in the form of [the action\_mailer\_tls gem][1]. Following the readme will get you to right
where you want to be – shoveling all the mail you would like into the ether that is the interwebs.

[1]: https://github.com/openrain/action_mailer_tls/tree/master
