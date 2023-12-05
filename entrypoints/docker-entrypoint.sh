#!/bin/sh

set -e

echo "Starting entrypoint script..."

PID_FILE="/usr/src/app/tmp/pids/server.pid"

if [ -f $PID_FILE ]; then
  echo "Removing stale server PID file..."
  rm $PID_FILE
fi

exec bundle exec rails s -b 0.0.0.0

echo "server started"