FROM ruby:3.0.2-alpine

# Set final workdir
WORKDIR /var/www

# Add required sh tools
RUN apk add postgresql-dev \
  --no-cache \
  --repository http://dl-3.alpinelinux.org/alpine/v3.6/main/ && \
  apk add --no-cache --update alpine-sdk netcat-openbsd less nodejs libcurl libxslt-dev tini && \
  rm -rf .git

# Add Gemfile
ADD Gemfile* /var/www/

# Install code dependencies
RUN gem install bundler

# Install gems
RUN bundle install

# Add the application
ADD . /var/www

# Final touchups
ENTRYPOINT [ "/sbin/tini", "-sgvv", "--" ]
CMD puma