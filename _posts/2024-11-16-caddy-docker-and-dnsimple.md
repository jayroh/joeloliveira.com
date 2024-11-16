---
title: caddy, docker, and dnsimple
category: blog
author: Joel
layout: post
permalink: 2024/11/16/caddy-docker-and-dnsimple.html
alias: 2024/11/16/caddy-docker-and-dnsimple
intro: Where I get Caddy to work with DNSimple's TLS challenge
---

"I'm experimenting wth Caddy as a replacement for Nginx."

Right now, that's an aspirational statement, and not entirely factual.

Because, I would need to get Caddy to _run_ properly to actually experiment
with it.

Alright, haha -- enough sarcasm.

***

In order for me to get Caddy to run with the following requirement - must have
a Caddy docker image that supports DNSimple's TLS challenge. The stock Caddy
docker image you get from [Dockerhub](https://hub.docker.com/_/caddy) does not
have all of the DNS providers. As a result, you need to build your own image
containing the [DNSimple module](https://github.com/caddy-dns/dnsimple). How
might you do this?

Edit your `Dockerfile`.

```dockerfile
FROM caddy:builder AS builder

# Set Go environment variables to fetch dependencies directly
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.io
ENV GOSUMDB=off

RUN xcaddy build --with github.com/caddy-dns/dnsimple

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
```

When I attempted to build an image with the above, not containing the `ENV`'s
I would run into errors related to the proxies used to fetch the Go libraries.
The `ENV`'s above were helpful to get things to work, thanks to the comments
[here](https://github.com/spf13/viper/issues/432) in a Github issue.

Built with:

`docker build -t caddy-with-dnsimple .`

Bonus `compose.yml` contents:

```yaml
services:
  caddy:
    image: caddy-with-dnsimple
    container_name: caddy
    hostname: caddy
    restart: always
    volumes:
      - ./data/caddy:/data
      - ./data/caddy/Caddyfile:/etc/caddy/Caddyfile
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 80:80
      - 443:443
```

And started with `docker compose up -d`
