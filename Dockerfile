FROM ruby:2.3

ENV RAILS_VERSION 4.2.8

RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN gem install rails -v '4.2.8'

RUN bundle install

RUN cp config/example.application.yml config/application.yml

RUN cp config/example.database.yml config/database.yml

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

EXPOSE 3000
