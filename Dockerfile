FROM ruby:3.0.3-alpine

RUN apk add --update --virtual \ 
  postgresql-client \
  build-base \
  nodejs \
  postgresql-dev \
  tzdata \
  gcompat \
  && rm -rf /var/cache/apk/*

RUN gem install --user-install nokogiri

WORKDIR /moose-app

COPY . /moose-app

RUN bundle install

CMD ["rails", "s"]

EXPOSE 3000