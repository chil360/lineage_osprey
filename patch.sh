#!/bin/sh

TOP=${PWD}

#############################################################
# PATCHES                                                   #
#############################################################

cd vendor/lineage
git am -3 ../../0001-DNM-Allow-insecure-ADB.patch
cd $TOP

cd system/qcom
git am -3 ../../0001-DNM-libqsap_sdk-Suppress-warnings.patch
cd $TOP

cd device/motorola/msm8916-common
git am -3 ../../../0001-DO-NOT-MERGE-msm8916-common-Force-battery-led-off.patch
cd $TOP

cd frameworks/native
git am -3 ../../0001-Gralloc2-Allow-invalid-usage-bits.patch
cd $TOP

cd frameworks/av
git am -3 ../../0001-DNM-HAL1-Hack-disable-UID-active-check.patch
cd $TOP

#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: ./vendor/lineage/build/tools/repopick.py [CHANGE_NUMBER]
