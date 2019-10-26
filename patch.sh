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

### build/soong
repopick 256886

### external/tinycompress
repopick 256308

### frameworks/av
repopick 256899

### hardware/lineage/interfaces
repopick 256420

### Backuptool
repopick 257172 257177
repopick -t ten-aonly-backuptool

### Fixes & Features
repopick -t ten-visualizer
repopick -t ten-messaging

