#!/bin/bash

OPENWRT_SDK=/home/build/openwrt

cd $OPENWRT_SDK

./scripts/feeds update -a
make menuconfig

if [ ! -f .config ]; then
  echo ".config from make menuconfig doesn't exists"
  exit 1;
fi

cat .config | sed -s 's/-/_/g' > .config.env

source .config.env

GCCV=7.4.0 # TODO
ARCH=$CONFIG_ARCH  # subst i486,i386, subst i586,i386, subst i686,i386
#ARCH_SUFFIX=_$CONFIG_CPU_TYPE TODO
ARCH_SUFFIX=""
BOARD=$CONFIG_TARGET_BOARD
LIBC=$CONFIG_LIBC

DIR_SUFFIX=$LIBC

TARGET_DIR_NAME=target-${ARCH}${ARCH_SUFFIX}_${DIR_SUFFIX}
TOOLCHAIN_DIR_NAME=toolchain-${ARCH}${ARCH_SUFFIX}_gcc-${GCCV}_${DIR_SUFFIX}

export TOOLCHAIN_DIR=$OPENWRT_SDK/staging_dir/$TOOLCHAIN_DIR_NAME
export STAGING_DIR=$OPENWRT_SDK/staging_dir/$TARGET_DIR_NAME
export STAGING_DIR_ROOT=$STAGING_DIR/root-$BOARD
export STAGING_DIR_HOST=$OPENWRT_SDK/staging_dir/host
export STAGING_DIR_HOSTPKG=$OPENWRT_SDK/staging_dir/hostpkg
export PATH=$TOOLCHAIN_DIR/bin:$STAGING_DIR_HOST/bin:$STAGING_DIR_HOSTPKG/bin:$PATH        
export CROSS_COMPILE_TOOLCHAIN_PREFIX=$ARCH-openwrt-linux-$LIBC

/home/build/sdk/$@