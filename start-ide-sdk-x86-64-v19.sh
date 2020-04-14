#!/bin/bash
export DOCKER_SERVICE=openwrt-sdk-ide
export DOCKER_CONTAINER=openwrt-sdk-ide-x86-64-v19
export DOCKER_COMPOSE_FILE=docker-compose.x86_64-v19.yml
./scripts/run.sh $@
