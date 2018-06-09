FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile.lock Gemfile ./
RUN bundle install
COPY . .

ENV PORT 5000
EXPOSE $PORT

ENV DB_HOST host.docker.internal
ENV USERNAME baldor
ENV PASSWORD baldor123

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

# CMD puma -C ./config/puma.rb
# CMD ["./your-daemon-or-script.rb"]



