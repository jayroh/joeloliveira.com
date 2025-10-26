---
title: Self-hosting Garage for object storage
category: blog, dev, shubox, s3
author: Joel
layout: post
permalink: 2025/10/26/self-hosting-garage-for-object-storage.html
alias: 2025/10/26/self-hosting-garage-for-object-storage
intro: The one where I play with more object storage options
photo: ./images/photos/garage.jpg
---

<figure class="photo-with-caption">
  <picture>
    <!--[if IE 9]><video style="display: none;"><![endif]-->
    <source srcset="{% imgproxy_url path: "/images/photos/garage.jpg", resizing_type: 'fill', width: 1344, format: 'avif' %}" type="image/avif" media="(min-width: 413px)" />
    <source srcset="{% imgproxy_url path: "/images/photos/garage.jpg", resizing_type: 'fill', width: 1344, format: 'webp' %}" type="image/webp" media="(min-width: 413px)" />
    <source srcset="{% imgproxy_url path: "/images/photos/garage.jpg", resizing_type: 'fill', width: 738, format: 'avif' %}" type="image/avif" media="(max-width: 413px)" />
    <source srcset="{% imgproxy_url path: "/images/photos/garage.jpg", resizing_type: 'fill', width: 738, format: 'webp' %}" type="image/webp" media="(max-width: 413px)" />
    <!--[if IE 9]></video><![endif]-->
    <img src="{% imgproxy_url path: "/images/photos/garage.jpg", resizing_type: 'fill', width: 738 %}"
      decoding="async"
      alt="Photo of a garage courtesy Todd Kent @ Unsplash"
      width="369"
      height="656" />
  </picture>

  <figcaption>
    Photo of a full, busy, garage. <a href="https://unsplash.com/@churchoftodd" target="_blank">Courtesy Todd Kent @ Unsplash</a>
  </figcaption>
</figure>

Due to the work on [Shubox](https://shubox.io) over the years block storage had become an interesting little corner 
that I've enjoyed researching. I had already played with [minio](/2024/10/06/play-with-minio) and found it
to be _fine_. Recently, the maintainers of Minio had [decided to change directions](https://www.reddit.com/r/selfhosted/search/?q=minio) in how "open"
they wanted to make their "open source" product. That's fine. With the velocity and severity of these
changes, though, it made sense to take a look at something that doesn't risk having an even more severe 
rug-pull moment. Hence - [garage](https://garagehq.deuxfleurs.fr).

## Up and running with Garage

Docker compose is my usual method for spinning up services in-house. For this experiment I decided
to try both the main service and the [garage-webui](https://github.com/khairul169/garage-webui) project up and running together.

One constraint - this is a single node installation, no replication. Just one machine, one instance.

Here's a pretty base compose setup to do so:

```yaml
services:
  garage:
    image: dxflrs/garage:v2.1.0
    container_name: garage
    volumes:
      - ./garage.toml:/etc/garage.toml
      - ./meta:/var/lib/garage/meta
      - ./data:/var/lib/garage/data
    restart: unless-stopped
    ports:
      - 3900:3900
      - 3901:3901
      - 3902:3902
      - 3903:3903
  garage-webui:
    image: khairul169/garage-webui:1.1.0
    container_name: garage-webui
    restart: unless-stopped
    volumes:
      - ./garage.toml:/etc/garage.toml:ro
    ports:
      - 3909:3909
    environment:
      API_BASE_URL: "http://garage:3903"
      S3_ENDPOINT_URL: "http://garage:3900"
    depends_on:
      - garage
    healthcheck:
      test: ["CMD-SHELL", "curl -f http://localhost:3909 || exit 1"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 20s
```

Where the contents of `./garage.toml` are:

```toml
metadata_dir = "/var/lib/garage/meta"
data_dir = "/var/lib/garage/data"

replication_factor = 1

rpc_bind_addr = "[::]:3901"
rpc_public_addr = "[::]:3901"
rpc_secret = "..." # generate secret with `openssl rand -hex 32`

bootstrap_peers = []

[s3_api]
s3_region = "bully"
api_bind_addr = "[::]:3900"
root_domain = ".s3.your-domain.com"

[s3_web]
bind_addr = "[::]:3902"
root_domain = ".web.your-domain.com"
index = "index.html"

[admin]
api_bind_addr = "[::]:3903"
admin_token = "..."   # generate secret with `openssl rand -hex 32`
metrics_token = "..." # generate secret with `openssl rand -hex 32`
```

A quick `docker compose up -d` will get that up and running.

## Create a cluster layout

While it may be up and running, you'll still need to allocate the disk space (layout) for Garage.
Here's how:

```sh
# get the node id
NODE_ID=`xxd -p ./meta/node_key.pub | tr -d '\n'`

# shorthand for the garage cli
alias garage='docker exec garage /garage -c /etc/garage.toml --rpc-host $NODE_ID@127.0.0.1:3901'

# check status
garage status

# assign node and cluster layout with zone name (dc1) and disk space (10G)
garage layout assign $NODE_ID -z dc1 -c 10G

# apply the layout
garage layout apply --version 1
```

## Check your work

At this point you should be able to visit `http://[host-ip]:3909`, see Garage-webui, create buckets &amp; keys, etc.
Beyond that, you should install an s3 client like [awscli](https://github.com/aws/aws-cli), [mc](https://github.com/minio/mc), or [s5cmd](https://github.com/peak/s5cmd) to test your buckets with whatever key and secret you've created via `garage-webui`.

Enjoy! 🛠️️
