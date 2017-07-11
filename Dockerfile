# create DMP_roadmap container from source.

#FROM ruby:2.3.4
FROM ruby:2.2.2

RUN gem install bundler
RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app
RUN cd /app && bundle install

ADD . /app

EXPOSE 3000
CMD bundle exec rails s -p 3000 -b '0.0.0.0'

