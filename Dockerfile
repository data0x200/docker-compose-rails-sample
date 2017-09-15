FROM ruby:2.4.1

RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential npm
ENV DISPLAY :99
RUN mkdir /app

WORKDIR /app
RUN bundle config build.nokogiri --use-system-libraries

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD package.json /app/package.json

RUN bundle install --path vendor/bundle
RUN npm install --no-optional

ADD . /app
