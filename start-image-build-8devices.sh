#!/bin/bash
export DOCKER_SERVICE=openwrt-image-build
export DOCKER_CONTAINER=openwrt-sdk-build-8devices
export DOCKER_COMPOSE_FILE=docker-compose.8devices.yml
./scripts/run.sh $@
