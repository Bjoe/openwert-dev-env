#!/bin/bash
export DOCKER_SERVICE=openwrt-sdk-ide
export DOCKER_CONTAINER=openwrt-sdk-ide-i386-snapshot
export DOCKER_COMPOSE_FILE=docker-compose.i386-snapshot.yml
./scripts/run.sh $@
