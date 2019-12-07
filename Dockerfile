FROM ruby:2.4.2
EXPOSE 80
EXPOSE 3000
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
RUN gem update --system
RUN gem install bundler -v 2.0.1
RUN bundle install
CMD ["rake", "db:create"]
CMD ["rake", "db:migrate"]
RUN rails s
