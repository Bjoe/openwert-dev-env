#!/bin/bash
export DOCKER_SERVICE=openwrt-image-build
export DOCKER_CONTAINER=openwrt-image-build
export DOCKER_COMPOSE_FILE=docker-compose.yml
./scripts/run.sh $@
