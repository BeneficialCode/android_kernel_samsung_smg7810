#!/bin/bash

mkdir out
BUILD_CROSS_COMPILE=/home/simon/source/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=/opt/qcom/Qualcomm_Snapdragon_LLVM_ARM_Toolchain_OEM/10.0.11.0/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE vendor/r8q_chn_openx_defconfig CC=$KERNEL_LLVM_BIN
make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE CC=$KERNEL_LLVM_BIN
 
cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
