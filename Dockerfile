FROM ruby:2.7.2-alpine

WORKDIR ./app

COPY Gemfile /app/

COPY Gemfile.lock /app/

RUN bundle install 

COPY . /app/

CMD ["rake", "test"]




