#!/bin/bash
export DOCKER_SERVICE=openwrt-sdk-ide
export DOCKER_CONTAINER=openwrt-sdk-ide-x86-64-snapshot
export DOCKER_COMPOSE_FILE=docker-compose.x86_64-snapshot.yml
./scripts/run.sh $@
