#!/bin/sh

set -e
bundle install
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec sidekiq -q mailers
