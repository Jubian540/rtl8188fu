#!/bin/bash

KERNEL=$PWD/../kernel
ROOTFS=$PWD/../rootfs
ARCH=arm
CROSSCOMPILE=arm-himix100-linux-
CORE=`cat /proc/cpuinfo |grep "processor"|wc -l`
THREAD=$(($CORE*2))

make -C $PWD ARCH=$ARCH CROSS_COMPILE=$CROSSCOMPILE KSRC=$KERNEL clean -j$THREAD
make -C $PWD ARCH=$ARCH CROSS_COMPILE=$CROSSCOMPILE KSRC=$KERNEL -j$THREAD
cp 8188fu.ko $ROOTFS/ko/
