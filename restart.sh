#!/bin/bash
git pull
bundle config set --local deployment 'true'
bundle install
bundle exec rake assets:precompile db:migrate RAILS_ENV=production
touch tmp/restart.txt