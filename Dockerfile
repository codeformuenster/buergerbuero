FROM ruby:2.2

RUN curl -SL http://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz \
  | zcat > /usr/local/bin/go-cron \
  && chmod u+x /usr/local/bin/go-cron

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install
COPY . /usr/src/app

RUN touch /srv/scraperwiki.sqlite \
  && ln -s /srv/scraperwiki.sqlite

ENV RACK_ENV production
EXPOSE 80
VOLUME /srv
