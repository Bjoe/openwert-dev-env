#!/bin/bash

if [ -z "$SRC" ];then
    echo "Set SRC environment to project dir";
    exit 1;
fi

export DOCKER_IMAGE=openwrt-sdk
export DOCKER_CONTAINER=compose_openwrt-sdk_run_1
export DOCKER_COMPOSE_FILE=docker-compose-build.yml
./scripts/run.sh $@
