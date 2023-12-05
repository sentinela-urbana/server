FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y nodejs npm yarn build-essential libpq-dev

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./

ENTRYPOINT ["tail", "-f", "/dev/null"]