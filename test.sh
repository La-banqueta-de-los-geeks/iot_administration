#/bin/bash
if [ "$RUN_SIDEKIQ" = 0 ]; then
  "sidekiq"
else
  "rails"
fi