#!/bin/bash
export DOCKER_SERVICE=openwrt-sdk-ide
export DOCKER_CONTAINER=openwrt-sdk-ide-i386-v18
export DOCKER_COMPOSE_FILE=docker-compose.i386-v18.yml
./scripts/run.sh $@
