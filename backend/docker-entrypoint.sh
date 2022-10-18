#!/bin/sh


set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo "Migration is running"
RAILS_ENV=development rails db:migrate
echo "Migration is done"

rails server -p 80 -b 0.0.0.0

exec bundle exec "$@"
