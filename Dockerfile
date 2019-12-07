FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
CMD ["gem", "update", "--system"]
CMD ["gem", "install", "bundler", "-v", "2.0.1"]
CMD ["bundler", "update", "--bundler"]
RUN bundle install
CMD ["rails", "db:create"]
CMD ["rails", "db:migrate"]
CMD ["rails", "server"]
