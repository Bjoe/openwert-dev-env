#!/bin/bash

OPENWRT_SDK=/home/build/openwrt

cd $OPENWRT_SDK

if [ -e /home/build/sdk/feeds.conf ]; then
    cp /home/build/sdk/feeds.conf .
    cat feeds.conf.default >> feeds.conf
fi

./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig

GCCV="5.3.0"
ARCH="mips"
ARCH_SUFFIX="_34kc"
BOARD="ar71xx"
LIBC="musl"
LIBC_VERSION="1.1.14"

DIR_SUFFIX=${LIBC}-${LIBC_VERSION}
TARGET_DIR_NAME=target-${ARCH}${ARCH_SUFFIX}_${DIR_SUFFIX}
TOOLCHAIN_DIR_NAME=toolchain-${ARCH}${ARCH_SUFFIX}_gcc-${GCCV}_${DIR_SUFFIX}

export TOOLCHAIN_DIR=$OPENWRT_SDK/staging_dir/$TOOLCHAIN_DIR_NAME
export STAGING_DIR=$OPENWRT_SDK/staging_dir/$TARGET_DIR_NAME
export STAGING_DIR_ROOT=$STAGING_DIR/root-$BOARD
export STAGING_DIR_HOST=$OPENWRT_SDK/staging_dir/host
export STAGING_DIR_HOSTPKG=$OPENWRT_SDK/staging_dir/hostpkg
export PATH=$TOOLCHAIN_DIR/bin:$STAGING_DIR_HOST/bin:$STAGING_DIR_HOSTPKG/bin:$PATH        
export CROSS_COMPILE_TOOLCHAIN_PREFIX=$ARCH-openwrt-linux-$LIBC
export PKG_CONFIG_PATH=$STAGING_DIR/usr/lib/pkgconfig

/home/build/sdk/$@
