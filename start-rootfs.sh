#!/bin/bash

echo "==============================================================================="
echo "Install additional pkg after running the rootfs"
echo "opkg update && opkg install libstdcpp6 gdb gdbserver openssh-sftp-server"
echo "==============================================================================="
./scripts/run.sh $@ openwrt-rootfs