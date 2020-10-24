FROM ruby:2.7.2-alpine

RUN gem install bundler

RUN bundle add rspec

RUN bundle add rake

WORKDIR /src

COPY Gemfile Gemfile.lock ./

RUN bundle install

CMD ["rake", "test"]



