#!/bin/bash

echo "==============================================================================="
echo "Install additional pkg after running the rootfs"
echo "opkg update && opkg install libstdcpp6 gdb gdbserver openssh-sftp-server"
echo "==============================================================================="
export DOCKER_SERVICE=openwrt-rootfs
export DOCKER_CONTAINER=openwrt-rootfs-x86_64-v19
export DOCKER_COMPOSE_FILE=docker-compose.x86_64-v19.yml
./scripts/run.sh $@