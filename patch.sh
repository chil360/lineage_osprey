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

#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: repopick [CHANGE_NUMBER]

### hardware/lineage/interfaces
repopick 256420

### Backuptool
repopick 257172 257177
repopick -t ten-aonly-backuptool

### Fixes & Features
repopick -t ten-visualizer

### Sepolicy
repopick -P system/sepolicy 264230 264057 264266 264267 264406 264432
repopick 261512

