#!/bin/bash

echo "==============================================================================="
echo "Install additional pkg after running the rootfs"
echo "opkg update && opkg install libstdcpp6 gdb gdbserver openssh-sftp-server"
echo "==============================================================================="
export DOCKER_IMAGE=openwrt-rootfs
export DOCKER_CONTAINER=compose_openwrt-rootfs_run_1
export DOCKER_COMPOSE_FILE=docker-compose.yml
./scripts/run.sh $@