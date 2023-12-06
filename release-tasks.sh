#!/bin/bash
# release-tasks.sh

echo "Running release tasks"

# Run database migrations
echo "Running database migrations"
bundle exec rake db:migrate

# Any other task can be placed here
# For example, you might want to seed your database
# bundle exec rake db:seed

echo "Release tasks finished"