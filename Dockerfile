FROM ruby:3.2.2

# Set final workdir
WORKDIR /myapp

# Add required sh tools
# RUN apk add postgresql-dev \
#   --no-cache \
#   --repository http://dl-3.alpinelinux.org/alpine/v3.6/main/ && \
#   apk add --no-cache --update alpine-sdk netcat-openbsd less nodejs libcurl libxslt-dev tini && \
#   rm -rf .git

# Run apt-get packages for FE and DB
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Add Gemfile
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

# Add the application
COPY . .

# Final touchups
# ENTRYPOINT [ "/sbin/tini", "-sgvv", "--" ]
# CMD bin/rails server -b 0.0.0.0