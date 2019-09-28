#!/bin/sh

TOP=${PWD}
echo "TOP: $TOP"

. build/envsetup.sh

#############################################################
# PATCHES                                                   #
#############################################################

cd system/core
git am -3 $TOP/0001-Revert-Remove-unused-logging-symbols.patch
cd $TOP

cd vendor/lineage
git am -3 $TOP/0001-DNM-Turn-off-secure-ADB.patch
cd $TOP

cd vendor/qcom/opensource/audio
git am -3 $TOP/0001-Revert-audio-Retrieve-feature-flag-from-config-store.patch
cd $TOP

#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: repopick [CHANGE_NUMBER]

### art
repopick 256444

### build/make
repopick 257171

### build/soong
repopick 256886

### external/sony/boringssl-compat
repopick 256250

### external/tinycompress
repopick 256308

### frameworks/av
repopick 256887-256894 256896-256899

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
repopick -t ten-wlan-caf

### vendor/lineage
repopick 256900

### Fixes & Features
repopick 258476
repopick -t ten-wake-on-plug
repopick 259362
repopick -t ten-linked-volumes
repopick 258767 258769 258768  #ten-buttons
repopick -t ten-visualizer

