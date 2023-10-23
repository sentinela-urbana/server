FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y nodejs npm yarn postgresql-client libpq-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT [ "./entrypoints/docker-entrypoint.sh" ]
