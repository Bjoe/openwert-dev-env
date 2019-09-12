#!/bin/bash

if [ -z "$SRC" ];then
    echo "Set SRC environment to project dir";
    exit 1;
fi

USER_ID=$(id -u ${USER}) \
GROUP_ID=$(id -g ${USER}) \
docker-compose -f compose/docker-compose-build.yml run $@ openwrt-sdk
