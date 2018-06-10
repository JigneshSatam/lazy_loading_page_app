FROM ruby:2.5.1-alpine
RUN apk update \
  && apk add --virtual gcc \
  && apk add --virtual musl-dev \
  && apk add --virtual make
RUN apk add postgresql-dev
RUN apk add nodejs
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN  apk del gcc \
  && apk del musl-dev \
  && apk del make
COPY . .
ENTRYPOINT ["sh", "./start-server.sh"]

# docker build -t ruby-alpine .
# docker run  -p 80:5000 -v ~/My_Projects/lazy_loading_page_app:/usr/src/app --rm  ruby-alpine
