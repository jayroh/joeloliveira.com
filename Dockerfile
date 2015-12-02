FROM ruby:2.2.3-slim
MAINTAINER joel.oliveira@gmail.com

WORKDIR /tmp
RUN mkdir -p /tmp/
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/

RUN apt-get update \
  && apt-get install -y build-essential node python-pygments \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && bundle install

VOLUME /src
EXPOSE 3600

WORKDIR /src
CMD jekyll serve -P 3600 --watch --force_polling
