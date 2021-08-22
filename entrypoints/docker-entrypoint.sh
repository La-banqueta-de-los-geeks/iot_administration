#!/bin/sh
set -e
bundle install
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

if [ "$RUN_SIDEKIQ" = 0 ]; then
  bundle exec sidekiq
fi

if [ "$RUN_MAILERS" = 0 ]; then
  bundle exec sidekiq -q mailers
fi

if [ "$RUN_MOSQUITTO" = 0 ]; then
  rake mqtt_history_devices:subscribe
fi

bundle exec rails s -b 0.0.0.0