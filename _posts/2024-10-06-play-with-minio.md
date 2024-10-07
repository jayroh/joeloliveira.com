---
title: play with minio
category: blog, tech
author: Joel
layout: post
permalink: 2024/10/06/play-with-minio.html
alias: 2024/10/06/play-with-minio
intro: Where I play with an S3 surrogate
---

To say that I'm interested in or curious about object storage in the cloud is an understatement. I work on an app in my spare time that acts as an abstraction layer on top of Amazon S3 ([Shubox](https://shubox.io) - go check it out). So, yes, I enjoy looking into anything and everything in that space.

Something that's been on my radar for a long while now, are the self-hosted S3 clones that have popped up over the last several years. The bigger one of them would have to be Minio. They've been around for about 10 years now and have grown themselves into a proper enterprise software solution. Good for them. Being the "on-prem S3 company" is nothing to scoff at.

But I am not of that scale.  I am of the ... hobbyiest at home ... scale. I wouldn't even register on a scale. Anywho ...

The point here, is - you could host an "S3-LIKE" on your home machine(s) and play with it however you like. I'm currently playing with it as an object store for screenshots and images. And so far, so good.

***

So, how do you run it? Docker's probably the easiest way.

```
mkdir -p /tmp/data

docker run \
   -p 9000:9000 \
   -p 9001:9001 \
   --name minio \
   -v /tmp/data:/data \
   -e "MINIO_ROOT_USER=admin" \
   -e "MINIO_ROOT_PASSWORD=password" \
   quay.io/minio/minio server /data --console-address ":9001"
```

***Translation:***

1. Run the `minio` docker image as a container
2. Binding ports 9000 and 9001 to your host machine
3. Where `9001` is the console / "web admin" port, and `9000` is the REST api port
4. The username and password are `admin` and `password`
5. And the container's `/data` directory is mounted in `/tmp/data` on your machine.

This will get it up and running. You can visit `http://localhost:9001` and log into the console with said username and password.

That's the easiest way to play with it - create buckets, upload files, etc.

***

***Awesome.*** Now what about working with it from a client machine, with their `mc` "minio client" utility?

```
# Let's assume you're on a mac with homebrew
brew install minio-mc

# alias "minio" in the `mc` config to your localhost REST api port, with that username and password
mc alias set minio http://localhost:9000 admin password

# show information about the running instance
mc admin info minio

# make a bucket called `berkit`
mc mb minio/berkit

# copy a file into `berkit`
mc cp photo.jpg minio/berkit

# list files in `berkit`
mc ls minio/berkit
```

Pretty straightforward. There isn't much you can't figure out by running `mc --help`.

***

***What else?*** You can use regular S3 clients, like [s3cmd from s3tools](https://s3tools.org/s3cmd).

Create a file in `~/.s3cfg` with the following:

```
# Setup endpoint
host_base = localhost:9000
host_bucket = localhost:9000
bucket_location = us-east-1
use_https = False

# Setup access keys
access_key =  admin
secret_key = password

# Enable S3 v4 signature APIs
signature_v2 = False
```

Which you can use like it was regular old AWS S3!

```
s3cmd ls s3://berkit
s3cmd put index.html s3://berkit
```

***

Of course there's more, but that will give you a sense of how easy it is to tinker with it and see what's available. If you'd like to look a little further into it, I recommend the ["MinIO for Developers"](https://www.youtube.com/playlist?list=PLFOIsHSSYIK37B3VtACkNksUw8_puUuAC) YouTube playlist. There's quite a bit there.

One thing I'll mention before closing this out - testing with your favorite FTP, or S3 object storage client. Something like [Transmit]( https://panic.com/transmit/) from [Panic](https://panic.com/). I spent a good bit of time banging my head against the wall trying to get Transmit to connect to my instance of MinIO. Turns out, Transmit will not connect to an "S3-Like" unless it's got an SSL cert in front of it. There's no way to tell it to not care (like you can in s3cmd or the native mc client). Once I put port `[ip address]:9000` behind a LetsEncrypt cert with a hostname, I was able to point Transmit at it, and it worked out A-OK.
