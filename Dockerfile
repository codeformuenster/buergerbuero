FROM ruby:2.1.5-onbuild

RUN apt-get update && apt-get install curl \
  && curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz \
    | zcat > /usr/local/bin/go-cron \
  && chmod u+x /usr/local/bin/go-cron

EXPOSE 80
CMD ["foreman", "start", "-e", "production.env"]
