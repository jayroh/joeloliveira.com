---
title: Weeknotes for the week ending Jun.17
category: weeknotes
author: Joel
layout: post
permalink: 2022/06/17/weeknotes-for-the-week-ending-jun-17.html
alias: 2022/06/17/weeknotes-for-the-week-ending-jun-17
intro: Chock-full-o-stuff-I-learned
---

<img src="{% imgproxy_url path: '/images/hazel.png', width: 400 %}" alt="Hazel.app icon or logo." width="200" height="200" align="right"> Hazel.app is an outstanding utility -- [one I've written about before](/2014/03/30/auto-delivering-your-downloaded-kindle-books.html) -- for watching directories and doing something based on when things changed, certain criteria, etc. The lightest lift is something like "move all screenshots in my Desktop to the trash after a month", yadda yadda.

I host this blog on Netlify, but new images are being served by an instance of `imgproxy` that grabs them from an s3 bucket. All new photos that I add to my local "photos" directory I also want sent up to that S3 bucket. Until now it's been a process of manually copying those files to the bucket.

Well, that's ***boring***.

How can I set things up to just automatically do it?

1. Install s3cmd
2. Set it up with `s3cmd --configure`. Save the config to the default location which is `~/.s3cfg`
3. Test it out: `s3cmd put /path/to/local/file.jpg s3://your-bucket/some/existing/directory/` (it should work)
4. If you're using Hazel, at this point you can drag the directory you're watching to the "Folders" pane on the left.
5. Create a new rule that looks something similar to:

   > If all of the following conditions are met:
   >
   >   _Extension is jpg_
   >
   > Do the following to the matched file or folder:
   >
   >   _Run shell script, embedded script, (i) Edit Script_

6. Click that "Edit Script" and make it look like:

   ```
   /opt/homebrew/bin/s3cmd --config=~/.s3cfg put $1 s3://your-bucket/your/target/path/
   ```

7. Open up the Hazel logs to make sure things worked: `Help -> View Logs`
