#! /bin/bash

mv local_manifest.xml .repo/local_manifest.xml

repo sync android-tuna-omap && cd kernel/samsung/tuna_franco && git checkout -b myself/exp -r franco/exp

cd device/samsung/maguro/BoardConfig && patch -p1 <./BoardConfig.mk.diff

export USE_CCACHE=1
#export CCACHE_DIR=<path-to-your-cache-directory>
#prebuilt/linux-x86/ccache/ccache -M 50G

. build/envsetup.sh
#export BUILD_TINY_ANDROID=true

brunch
#lunch

#make -j4 TARGET_KERNEL_BINARIES
