FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client \
    && apt-get update -qq && apt-get install -y apt-transport-https wget \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /myapp/config
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp