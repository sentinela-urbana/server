#!/bin/bash
echo "Running release tasks"

# Run database migrations
echo "Running database migrations"
bundle exec rake db:migrate

echo "Release tasks finished"