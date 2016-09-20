---
title: Auto-delivering Downloaded Kindle Books
author: Joel
layout: post
permalink: /2014/03/30/auto-delivering-your-downloaded-kindle-books.html
alias: /2014/03/30/auto-delivering-your-downloaded-kindle-books
---

I will often buy self-published programming books and send them to my kindle (and iPad, and iPhone) via email. Amazon's kindle platform will allow you to distribute documents (books) [to your devices via custom email addresses](https://www.amazon.com/gp/digital/fiona/manage#manageDevices). As mentioned I have three devices that I will often read from and need to send emails to those three with a downloaded mobi attachment. This is far from difficult but annoying enough that it could probably be automated. So I did.

You will need to allow an email address of yours to send the documents to kindle. [Visit your kindle settings page](https://www.amazon.com/gp/digital/fiona/manage#pdocSettings) and approve the email address you will be using (your Gmail address).

Tools necessary:

1. Hazel. [Download and purchase it](http://www.noodlesoft.com/hazel). It's worth it.
2. [sendemail](http://caspian.dotconf.net/menu/Software/SendEmail/). Install with homebrew - `brew install sendemail`. Done!

Open up Hazel's preferences, select the Downloads directory, and add a new rule:

![image](https://www.evernote.com/shard/s330/sh/ef70b02b-8570-42ff-811c-67a834dc467f/ed1c2e36859bcd7862b36283e0d6dac2/deep/0/Screenshot-3-30-14,-12-58-PM.png)

Where the embedded script looks similar to the command below. Note that the important part here is `-a $1` where this interpolates the path to the mobi file and sets it as the attached file.

```
sendemail \
 -t your.kindle.email@kindle.com your.other.email@kindle.com \
 -f your.google.username@gmail.com \
 -u "New book" \
 -m "See attached" \
 -a $1 \
 -s smtp.gmail.com:587 \
 -o tls=yes \
 -xu your.google.username \
 -xp your_google_password
```

That's it!

When you download a mobi file it will (semi-)instantly delivered to your kindle-capable devices. Voilà!
