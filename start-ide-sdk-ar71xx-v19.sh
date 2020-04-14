#!/bin/bash
export DOCKER_SERVICE=openwrt-sdk-ide
export DOCKER_CONTAINER=openwrt-sdk-ide-ar71xx
export DOCKER_COMPOSE_FILE=docker-compose.ar71xx-v19.yml
./scripts/run.sh $@
