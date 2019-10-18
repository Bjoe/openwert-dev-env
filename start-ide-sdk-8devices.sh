#!/bin/bash

USER_ID=$(id -u ${USER}) \
GROUP_ID=$(id -g ${USER}) \
docker-compose -f compose/docker-compose-8devices.yml run $@ openwrt-8devices-sdk-ide
