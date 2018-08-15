#!/bin/sh

TOP=${PWD}

#############################################################
# PATCHES                                                   #
#############################################################

cd vendor/lineage
git am -3 ../../0001-DNM-Allow-insecure-ADB.patch
git am -3 ../../0001-DNM-Use-AOSP-qcom-wlan.patch
cd $TOP

cd system/qcom
git am -3 ../../0001-DNM-libqsap_sdk-Suppress-warnings.patch
cd $TOP

cd hardware/qcom/fm
git am -3 ../../../0001-DNM-libfm_jni-Suppress-warnings.patch
cd $TOP


#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: ./vendor/lineage/build/tools/repopick.py [CHANGE_NUMBER]
