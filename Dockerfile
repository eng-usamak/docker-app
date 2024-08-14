#!/bin/bash

# Use the official Ruby image from the Docker Hub
FROM --platform=linux/amd64 ruby:2.7.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the Bundler version
RUN gem install bundler:2.2.4

# Set the working directory in the container
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock into the working directory
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install the required gems
RUN bundle install

# Copy the rest of the application code into the working directory
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
