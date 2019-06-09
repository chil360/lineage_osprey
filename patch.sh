#!/bin/sh

TOP=${PWD}
echo "TOP: $TOP"

. build/envsetup.sh

#############################################################
# PATCHES                                                   #
#############################################################

##
##  Lag Fixes
##
cd frameworks/base
git am -3 $TOP/0001-Improve-performance-of-unclipped-save-layers.patch
cd $TOP

cd external/skia
git am -3 $TOP/0001-Add-rect-parameter-to-makeImageSnapshot-and-stop-usi.patch
git am -3 $TOP/0002-fGpu-is-null-when-GrGpuResource-release.patch
cd $TOP

#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: repopick [CHANGE_NUMBER]
