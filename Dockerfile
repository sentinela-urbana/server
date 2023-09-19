FROM ruby:3.2.2-bullseye

RUN bundle config --global frozen 1

RUN apt-get update -qq && apt-get install -y nodejs npm yarn postgresql-client libpq-dev

RUN mkdir /app

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD . /app
