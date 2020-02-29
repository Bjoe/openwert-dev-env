#!/bin/bash
export DOCKER_IMAGE=openwrt-sdk-ide
export DOCKER_CONTAINER=compose_openwrt-sdk-ide_run_1
export DOCKER_COMPOSE_FILE=docker-compose.yml
./scripts/run.sh $@
