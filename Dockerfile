FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y nodejs npm yarn build-essential libpq-dev

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]