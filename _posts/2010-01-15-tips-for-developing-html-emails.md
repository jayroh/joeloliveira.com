---
title: Tips for developing HTML emails
author: Joel
layout: post
permalink: /2010/01/15/tips-for-developing-html-emails/index.html
categories:
  - Web Development
---
# 

![Nested tables FTL][1]  
**Option 1 – Don’t do it.**

 [1]: http://www.joeloliveira.com/wp-content/uploads/2010/01/140341-main_Full-e1263592316562.jpg "nested tables"

And if that’s not on the table (haha – get it?), I present to you …

**Option 2 – With a few things in mind when you approach the assignment you’ll get through it. It might not be the most fun, but it’s all doable.**

My first suggestion would be to take whatever time you estimated, and double it. Maybe triple it. If you’re reading this post in its entirety then I’m guessing it’s safe to assume these HTML emails aren’t a daily routine for you. If such is the case, the time it’ll take between your first  tag, and the moment the email is spammed sent out will not be insignificant – 2-3 times the markup, 2-3 times the complexity in testing esoteric email clients. Your mileage may vary, depending on what the targeted visual design is. It’s always up to your discretion – but the one thing I didn’t anticipate, that I know is a rule, not an exception, is the time you spend on the testing process.

Before starting – these are the things you should have up front to make your life semi-easier.

1.  **Create test accounts at gmail, hotmail, yahoo mail, and AOL.** Except you can probably ignore AOL out of principle. I felt *dirty* just typing that. As with most things related to this practice – having to maintain test accounts at these email services is usually more trouble than it’s worth, but save yourself time and pain by using some sort of password database, such as [1password][2]. Remembering passwords isn’t the hassle here – it’s the random usernames you’re going have to pull out of thin air, which you’ll end up using **very** infrequently. Trust me.
2.  **An account at an email campaign website like [CampaignMonitor][3] or [MailChimp][4].** I’m a big fan of, and more prone to recommend, MailChimp not only for their pricing and offerings but the user experience throughout. It’s on my short list of sites that are actually fun to use – as silly as that may sound. Why Mailchimp? You can set up a sample campaign, point to your code on your webhost of choice, and send emails using the code hosted out there in the wild.
3.  **A virtual machine with Windows, and the latest version of Office.** This one’s a given as most emails sent for B2B purposes will end up in MS Outlook. As of right now the latest is Office 2007, whose changes to how html emails are rendered are the single reason to pack up and go home if you can. Want more info? [Here you go][5]. Office costs money, obviously, but if you don’t plan on doing too many of these html emails, [there’s a free download at Microsoft’s][6] that you can use as a trial for 90 days or so. Otherwise, purchase your copy legit … or find somewhere that will assist you in a … \*cough\* … longer “*trial period*“.
4.  **If it’s in the budget – sign up for a screenshot generator.** If you’re tasked with testing your table-bloated masterpiece in more obscure email clients – Lotus, or Lotus Notes – whatever it’s called. Outlook 2003. The aforementioned AOL. You might want to invest in an account at one of the screenshot generator testing sites like [BrowserCam][7], [Litmus][8] or [CampaignMonitor][9]. Of those three I only plunked money down to try CampaignMonitor – which worked, but the screenshots were of varying quality. Some were half-generated. One looked like someone hit “ctrl-A” before the screenshot was taken. Very odd, but it did the trick to somewhat guess how things were looking. If I were to try any of those others instead I would probably go with Litmus. Again – [ymmv][10].

 [2]: http://agilewebsolutions.com/products/1Password
 [3]: http://www.campaignmonitor.com
 [4]: http://mailchimp.com
 [5]: http://www.google.com/search?q=html emails outlook 2007&ie=utf-8&oe=utf-8&aq=t
 [6]: http://us20.trymicrosoftoffice.com/default.aspx?culture=en-US
 [7]: http://browsercam.com
 [8]: http://litmusapp.com/
 [9]: http://www.campaignmonitor.com/features/make-and-send-great-looking-emails/
 [10]: http://en.wiktionary.org/wiki/your_mileage_may_vary

The following are the gotchas and tips I’ve become familiar with recently through the course of developing a handful of these emails. These somewhat defy the logic you might be used to when developing for the regular web – a medium that’s already tricky and nuanced. Coding for email clients is downright dumb in comparison.

1.  **Plan and internally conceptualize your tables.** Lots and lots of tables, obviously. Look at the PSD handed off to you and, in your head, plan ahead of time how you’re going to tackle the layout. Don’t try and get cute with an overabundance of col and rowspans. It will only make things more difficult over time. I found myself starting with a main outer table shell consisting of a few rows and cells to get the content justified.
2.  **Table cells that consist of just an image – make sure those images are all aligned left** (or right, if you are so inclined). Some current generation browsers will leave a gap after the bottom of the image for some reason, regardless of white-space in your markup. Sure,  might look great, but it will still jack up your already delicate table layout. So remember, aligning the image will fix this.
3.  **Background images. Completely forget about them.** They are dead to you. If you want this email to look flawless in Outlook 2007, there are no such thing as background images – either via inline CSS or the background property for TD’s. I hope you enjoy the slicing tool in Photoshop because you’re going to end up rather proficient in it by the time you’re done. Because of this I suggest you become friendly with whoever is designing the comp you’ll be developing. Possibly send them flowers or take them out to a nice lunch. Otherwise the possibility is quite real that you’ll receive a comp with copy floating all over and on top of arbitrary visual elements.
4.  On a similar note – **familiarize yourself with what is supported in the various email clients**. Campaign Monitor has put together [a rather handy matrix of email clients versus the CSS that is and is not supported][11]. Read through this as a primer and have it tucked away for future use – you’ll probably need it. Also at Campaign Monitor – [a collection of free email templates you may download][12] as reference, or possibly (if you bribe them), a basis for your designer to use as “inspiration”.
5.  **Don’t expect an inline style at the outermost TD declaring the font information to cascade into your inner table soup.** Somewhere in your code I suggest wrapping some comments around a collection of what you anticipate being a common set of inline style attributes. This will allow quick access to copy and paste into your ’s, ’s, ’s, etc.
6.  **And finally – Comments.** Be kind with your use of comments for the express purpose of landmarking where things are in your markup. Front-end development in 2010 is a beautiful thing and we forget how miserable it used to be 6 years ago. Over 25k in html alone is a hard thing to imagine these days, but when you get up to that you’ll thank yourself if you’ve placed gigantic honkin’ comments telling yourself where the left and right content starts and ends.

 [11]: http://www.campaignmonitor.com/css/
 [12]: http://www.campaignmonitor.com/templates/

Final thoughts – You will no longer take for granted the wonder and beauty that is good, clean, lovely, semantic markup. It absolutely boggles the mind that corporate IT managers will fall over themselves getting new versions of Office rolled out to their IT infrastructure, but OMG A POX ON NEW VERSIONS OF INTERNET EXPLORER (OH THE HORROR!).

Last but not least – know where the closest liquor/booze/package store is. You’ll need a drink or two by the time this is over.

(hat tip to [@bmenoza][13] for the nudge in getting this post up)

 [13]: http://twitter.com/bmenoza
