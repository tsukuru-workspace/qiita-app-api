FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /qiita-app-api
WORKDIR /qiita-app-api
ADD Gemfile /qiita-app-api/Gemfile
ADD Gemfile.lock /qiita-app-api/Gemfile.lock
RUN bundle install
ADD . /qiita-app-api
