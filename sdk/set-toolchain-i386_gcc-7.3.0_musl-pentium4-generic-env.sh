#!/bin/bash

OPENWRT_SDK=/home/build/openwrt

cd $OPENWRT_SDK

./scripts/feeds update -a
make menuconfig

if [ ! -f .config ]; then
  echo ".config from make menuconfig doesn't exists"
  exit 1;
fi

GCCV="7.3.0"
ARCH="i386"
CROSS_ARCH="i486"
ROOT_ARCH="x86"
ARCH_SUFFIX="_pentium4"
BOARD=""
LIBC="musl"
LIBC_VERSION=""

DIR_SUFFIX=${LIBC}
TARGET_DIR_NAME=target-${ARCH}${ARCH_SUFFIX}_${DIR_SUFFIX}
TOOLCHAIN_DIR_NAME=toolchain-${ARCH}${ARCH_SUFFIX}_gcc-${GCCV}_${DIR_SUFFIX}

export CROSS_COMPILE_TOOLCHAIN_PREFIX=${CROSS_ARCH}-openwrt-linux-${LIBC}
export TOOLCHAIN_DIR=$OPENWRT_SDK/staging_dir/$TOOLCHAIN_DIR_NAME
export STAGING_DIR=$OPENWRT_SDK/staging_dir/$TARGET_DIR_NAME
export STAGING_DIR_ROOT=$STAGING_DIR/root-${ROOT_ARCH}
export STAGING_DIR_HOST=$OPENWRT_SDK/staging_dir/host
export STAGING_DIR_HOSTPKG=$OPENWRT_SDK/staging_dir/hostpkg
export PATH=$TOOLCHAIN_DIR/bin:$STAGING_DIR_HOST/bin:$STAGING_DIR_HOSTPKG/bin:$PATH        

/home/build/sdk/$@