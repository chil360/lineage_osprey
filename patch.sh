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

### art
repopick 259265

### build/soong
repopick 256886

### external/sony/boringssl-compat
repopick 256250

### external/tinycompress
repopick 256308

### frameworks/av
repopick 256899

### hardware/qcom/bt
repopick -P hardware/qcom/bt 256355

### hardware/qcom-caf/msm8916/audio
repopick 258610-258612

### hardware/qcom-caf/msm8916/display
repopick 258603-258606

### hardware/qcom-caf/msm8916/media
repopick 258607-258609

### hardware/qcom-caf/wlan
repopick -P hardware/qcom/wlan 256362

### Backuptool
repopick 257172 257177
repopick -t ten-aonly-backuptool

### Fixes & Features
repopick -t ten-visualizer
repopick -t ten-messaging

