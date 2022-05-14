---
title: Weeknotes for the week ending May.13
category: weeknotes
author: Joel
layout: post
permalink: 2022/05/13/weeknotes-for-the-week-ending-may-13.html
alias: 2022/05/13/weeknotes-for-the-week-ending-may-13
intro: The problem is coming from _inside_ the house
photo: ./images/photos/orange-dots-are-bad.png
---

In keeping with the theme of sharing misery in the hopes that maybe someone, somewhere, runs into this problem
on Google some day and can save themselves from hours of struggling with "what the hell is happening here, exactly?"

... I present you a meditation on how Unifi's IPS (intrusion prevention system) can ruin your day.

***

I was home. I was toying around with some stuff. After spinning up some hosts on a cloud provider I tried to
`ssh-copy-id` a key into said hosts. Those worked just fine. Subsequent attempts to ssh into the machine did not. It
just sat there. Hanging. Frozen. Doin' nothing. Why?

I spent a little while troubleshooting. Thinking maybe the hosts had `ufw` turned on? Did an Ansible script
I ran have something in it that I didn't consider? Etc. All answers were "no". Huh.

What does `nmap` say about this?

```
$ nmap -Pn -p22 host-address
Starting Nmap 7.92 ( https://nmap.org ) at 2022-05-09 10:21 EDT
Nmap scan report for host-address (ip)
Host is up.

PORT   STATE    SERVICE
22/tcp filtered ssh

Nmap done: 1 IP address (1 host up) scanned in 2.08 seconds
```

`filtered`? Why?

What about another machine on my network?

```
$ nmap -Pn -p22 host-address
Starting Nmap 7.92 ( https://nmap.org ) at 2022-05-09 10:21 EDT
Nmap scan report for host-address (ip)
Host is up.

PORT   STATE    SERVICE
22/tcp open     ssh

Nmap done: 1 IP address (1 host up) scanned in 2.08 seconds
```

`open`? What the...?  Laptop on my home network - "no-go". Little homelab server - "a-ok". So it's something
on my network?

Yes. I'll cut to the chase.

If you run a Unifi rig at home, and you enable Unifi's "IPS", then you might have inadvertently enabled some security
rules that prevent doing something like `ssh-copy-id`. Your "event timeline" might look something like the following:

![Screenshot of what looked wrong](/images/photos/orange-dots-are-bad.png)

You can click the button on the right to allow from your/all ip's, or you can turn off this particular rule via:

```
Settings ▶
  Firewall & Security ▶
    System Sensitivity ▶
      Edit threat categories ▶
        ☑️ Scan
```

I should note, this might be only for the *UDM Pro*. [Kyle](https://twitter.com/kyleridolfo) let me know he doesn't see this in his *UDM*.

***

Happy networking!
