FROM ruby:2.1.5-onbuild

RUN apt-get update -y && apt-get install curl -y \
  && curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz \
    | zcat > /usr/local/bin/go-cron \
  && chmod u+x /usr/local/bin/go-cron

EXPOSE 9292
CMD ["puma"]
