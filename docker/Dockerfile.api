FROM ruby:3.1.0-alpine as builder
RUN apk update && \
  apk upgrade && \
  apk --no-cache add build-base make g++ sqlite-dev && \
  gem install bundler

WORKDIR /tmp
COPY api/Gemfile Gemfile
COPY api/Gemfile.lock Gemfile.lock
RUN bundle install

FROM ruby:3.1.0-alpine
ENV LANG ja_JP.UTF-8 
ENV TZ Asia/Tokyo
RUN apk --update add nodejs make g++ sqlite-dev && \
  gem install bundler

ENV APP_HOME /api
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY api $APP_HOME
