#!/usr/bin/env bash
docker-compose run --rm app $@
docker-compose run --rm app chown -R $(id -u):$(id -g) .