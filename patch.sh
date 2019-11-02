#!/bin/sh

TOP=${PWD}
echo "TOP: $TOP"

. build/envsetup.sh

#############################################################
# PATCHES                                                   #
#############################################################

cd vendor/lineage
git am -3 $TOP/0001-DNM-Turn-off-secure-ADB.patch
cd $TOP

cd system/sepolicy
git am -3 $TOP/0001-sepolicy-Optionally-build-sepolicy_freeze_test.patch
git am -3 $TOP/0002-Fix-storaged-access-to-sys-block-mmcblk0-stat-after-.patch
cd $TOP

#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: repopick [CHANGE_NUMBER]

### build/soong
repopick 256886

### external/tinycompress
repopick 256308

### frameworks/av
repopick 256899

### hardware/lineage/interfaces
repopick 256420

### device/lineage/sepolicy
repopick 257100

### Backuptool
repopick 257172 257177
repopick -t ten-aonly-backuptool

### Optimizations
repopick 262889

### Fixes & Features
repopick -t ten-visualizer

### Snap
repopick -t ten-snap
repopick 262413

### Sepolicy
repopick -t ten-legacy-qcom-sepolicy

