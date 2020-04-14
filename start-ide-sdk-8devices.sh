#!/bin/bash
export DOCKER_SERVICE=openwrt-sdk-ide
export DOCKER_CONTAINER=openwrt-sdk-ide-8devices
export DOCKER_COMPOSE_FILE=docker-compose.8devices.yml
./scripts/run.sh $@
