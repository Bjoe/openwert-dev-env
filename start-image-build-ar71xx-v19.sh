#!/bin/bash
export DOCKER_SERVICE=openwrt-image-build
export DOCKER_CONTAINER=openwrt-sdk-build-ar17xx
export DOCKER_COMPOSE_FILE=docker-compose.ar71xx-v19.yml
./scripts/run.sh $@
