FROM ruby:2.7.2-alpine

WORKDIR ./src/app

COPY Gemfile /src/app

COPY Gemfile.lock /src/app

RUN bundle install 

COPY . /src/app

CMD ["rake", "test"]




