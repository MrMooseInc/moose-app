FROM ruby:3.0.3-alpine

RUN apk add --update --virtual \ 
  postgresql-client \
  build-base \
  nodejs \
  postgresql-dev \
  tzdata \
  gcompat \
  && rm -rf /var/cache/apk/*

# RUN gem install --user-install nokogiri --platform=ruby -- --use-system-libraries
RUN gem install --user-install nokogiri

WORKDIR /moose-app

COPY . /moose-app

# ENV BUNDLE_PATH /gems
RUN bundle install

CMD ["rails", "s"]

EXPOSE 3000

# FROM ruby:3.0.3

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs gcompat

# RUN mkdir /moose-app

# WORKDIR /moose-app

# COPY Gemfile /moose-app/Gemfile

# COPY Gemfile.lock /moose-app/Gemfile.lock

# RUN bundle install

# COPY . /moose-app

# CMD ["rails", "s"]

# EXPOSE 3000
