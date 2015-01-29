FROM ruby:2.1.5-onbuild

RUN apt-get update
RUN apt-get install cron -y

RUN bundle install

RUN ["whenever", "-w"]
RUN crontab
RUN ["whenever", "-w"]

EXPOSE 80
CMD ["foreman", "start", "-e", "production.env"]
