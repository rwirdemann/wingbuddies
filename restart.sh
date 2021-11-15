#!/bin/bash
kill $(lsof -t -i:8080)
git pull
RAILS_SERVE_STATIC_FILES=true bin/rails server -b=0.0.0.0 -p=8080 -e=production -d