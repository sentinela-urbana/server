FROM ruby:3.3-rc-slim-bullseye

RUN bundle config --global frozen 1

RUN apt-get update -qq && apt-get install -y nodejs npm yarn postgresql-client libpq-dev

WORKDIR /usr/src/app

COPY Gemfile* /app/

COPY . .

RUN gem install bundler

RUN bundle install

RUN bundle binstubs --all
