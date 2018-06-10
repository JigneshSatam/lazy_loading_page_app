FROM ruby:2.5.1-alpine

RUN apk update \
  && apk add --virtual gcc \
  && apk add --virtual musl-dev \
  && apk add --virtual make

# RUN gem install nokogiri -v 1.8.2


RUN apk add --virtual postgresql-dev
# RUN gem install pg -v 1.0.0

# RUN apk add --virtual binutils-libs
# RUN apk add --virtual libgomp
# RUN apk add --virtual libatomic
# RUN apk add --virtual libgcc
# RUN apk add --virtual libstdc++
# RUN apk add --virtual libc-dev
# RUN apk add --virtual g++

    # && apk add --virtual fortify-headers
    # && apk add --virtual mpfr3 \
    # && apk add --virtual mpc1 \
    # && apk add --virtual gmp \
    # && apk add --virtual isl \


    # && apk add --virtual binutils \

    # postgresql-dev
    # build-dependencies
#         build-base \
#         gcc \
#         wget \
#         git \
#     && apk add \
#         bash
# RUN bundle config --global frozen 1
# RUN apk add world[build-deps]
# RUN apk add build-deps

# RUN apk add ruby-dev

# RUN apk add postgresql-dev

# RUN apk update && \
    # apk add --virtual build-deps gcc python-dev musl-dev && \
    # apk add postgresql-dev

WORKDIR /usr/src/app

COPY Gemfile ./

# RUN apk update && apk add git
# RUN gem install bundler

# ENV BUNDLER_VERSION 1.16

# RUN \
#   apk --update add ruby ruby-io-console ruby-irb ruby-json ruby-rake ruby-rdoc  && \
#   gem install bundler -v "$BUNDLER_VERSION" --no-document && \
#   bundle config --global silence_root_warning 1 && \
#   mkdir /app

# RUN apk --update add --virtual build_deps \
#     build-base ruby-dev libc-dev linux-headers \
#     openssl-dev postgresql-dev libxml2-dev libxslt-dev && \
#     sudo -iu app bundle install --path vendor/bundle && \
#     apk del  build_deps

# RUN apk add --update ruby-dev build-base \
#   libxml2-dev libxslt-dev pcre-dev libffi-dev \
#   mariadb-dev postgresql-dev

RUN apk add nodejs

RUN bundle install

COPY Gemfile.lock ./

COPY . .

# RUN ["sh", "-c", "./set-env.sh"]
# EXPOSE $PORT

ENTRYPOINT ["sh", "./start-server.sh"]


RUN  apk del gcc \
  && apk del musl-dev \
  && apk del make

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# CMD ["rails" , "s"]
# CMD ["sh" , "./start-server.sh"]



# docker build -t ruby-alpine .
# docker run  -p 80:5000 -v ~/My_Projects/lazy_loading_page_app:/usr/src/app --rm  ruby-alpine
