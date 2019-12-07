FROM sickp/alpine-ruby:2.4.3-r1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem update --system
RUN gem install bundler -v 2.0.1
RUN bundler update --bundler
RUN bundle install
RUN rails db:create
RUN rails db:migrate
RUN rails server
