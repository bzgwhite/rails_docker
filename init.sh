#!/bin/bash
cp .secret.env.sample .secret.env
docker-compose run web rails new . -s --no-deps --skip-budle --database=postgresql –skip-git
cp database.yml.sample config/database.yml \
    && docker-compose run web rake db:create
docker-compose up