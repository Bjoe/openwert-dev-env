#!/bin/bash
export DOCKER_SERVICE=openwrt-sdk-ide
export DOCKER_CONTAINER=openwrt-sdk-ide_latest
export DOCKER_COMPOSE_FILE=docker-compose.yml
./scripts/run.sh $@
