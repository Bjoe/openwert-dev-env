#!/bin/bash
export DOCKER_IMAGE=openwrt-image-build
export DOCKER_CONTAINER=compose_openwrt-image-build_run_1
export DOCKER_COMPOSE_FILE=docker-compose.yml
./scripts/run.sh $@
