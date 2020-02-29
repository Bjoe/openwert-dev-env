#!/bin/bash
export DOCKER_IMAGE=openwrt-sdk-ide-x86-64-snapshot
export DOCKER_CONTAINER=compose_openwrt-sdk-ide-x86-64-snapshot_run_1
export DOCKER_COMPOSE_FILE=docker-compose.yml
./scripts/run.sh $@
