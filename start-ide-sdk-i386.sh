#!/bin/bash
export DOCKER_IMAGE=openwrt-sdk-ide-i386-snapshot
export DOCKER_CONTAINER=compose_openwrt-sdk-ide-i386-snapshot_run_1
export DOCKER_COMPOSE_FILE=docker-compose.yml
./scripts/run.sh $@
