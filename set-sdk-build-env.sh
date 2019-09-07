#!/bin/bash

if [ ! -f .config ]; then
  echo ".config from make menuconfig doesn't exists"
  exit 1;
fi

cat .config | sed -s 's/-/_/g' > .config.env

source .config.env

ARCH=$CONFIG_ARCH  # subst i486,i386, subst i586,i386, subst i686,i386
ARCH_SUFFIX=$CONFIG_CPU_TYPE
BOARD=$CONFIG_TARGET_BOARD
LIBC=$CONFIG_LIBC

DIR_SUFFIX=$LIBC
GCCV=7.3.0

TARGET_DIR_NAME=target-${ARCH}_${ARCH_SUFFIX}_${DIR_SUFFIX}
TOOLCHAIN_DIR_NAME=toolchain-${ARCH}_${ARCH_SUFFIX}_gcc-${GCCV}_${DIR_SUFFIX}

TOPDIR=$PWD #/home/build/openwrt

export TOOLCHAIN_DIR=$TOPDIR/staging_dir/$TOOLCHAIN_DIR_NAME
export STAGING_DIR=$TOPDIR/staging_dir/$TARGET_DIR_NAME
export STAGING_DIR_ROOT=$STAGING_DIR/root-$BOARD
export STAGING_DIR_HOST=$TOPDIR/staging_dir/host
export STAGING_DIR_HOSTPKG=$TOPDIR/staging_dir/hostpkg
export PATH=$TOOLCHAIN_DIR/bin:$STAGING_DIR_HOST/bin:$STAGING_DIR_HOSTPKG/bin:$PATH        
export CROSS_COMPILE_TOOLCHAIN_PREFIX=$ARCH-openwrt-linux-$LIBC
