#!/bin/sh

TOP=${PWD}
PATCH_DIR=$TOP

echo "TOP: $TOP"

. build/envsetup.sh

# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

function apply_patch {
    echo -e "${GREEN}Applying patch...${NOCOLOR}"
    echo -e "${LIGHTBLUE}Target repo:${NOCOLOR} $1"
    echo -e "${LIGHTBLUE}Patch file:${NOCOLOR} $2"
    echo ""

    cd $1
    git am -3 --ignore-whitespace $2
    cd $TOP
    echo ""
}

#############################################################
# PATCHES                                                   #
#############################################################

apply_patch $TOP/system/tools/mkbootimg $PATCH_DIR/0001-mkbootimg-add-support-for-dt.patch
apply_patch $TOP/bootable/recovery $PATCH_DIR/0001-Disable-install_recovery-script.patch
apply_patch $TOP/vendor/lineage $PATCH_DIR/0001-TEMP-Disable-ADB-authentication.patch
apply_patch $TOP/hardware/qcom-caf/wlan $PATCH_DIR/0001-Disable-Wformat-errors.patch
apply_patch $TOP/system/core $PATCH_DIR/0001-Revert-Reland-libcutils-remove-unused-jstring.h.patch
apply_patch $TOP/system/core $PATCH_DIR/0001-Revert-Move-adbd-s-legacy-USB-implementation-to-fast.patch

#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: repopick [CHANGE_NUMBER]

## Build Bringup
./vendor/lineage/build/tools/repopick.py -t eleven-build-warnings
./vendor/lineage/build/tools/repopick.py -t eleven-build
./vendor/lineage/build/tools/repopick.py -t eleven-build-bringup
./vendor/lineage/build/tools/repopick.py -t 11-nproc

## Art
./vendor/lineage/build/tools/repopick.py -P art -f 286185

## bionic
./vendor/lineage/build/tools/repopick.py -P bionic -f 286142 286007 286301-286305

## Build/Make
./vendor/lineage/build/tools/repopick.py  -f 256500 286188 286195 286189

## external/tinycompress
./vendor/lineage/build/tools/repopick.py -P external/tinycompress -f 286162 286163

## frameworks/av
./vendor/lineage/build/tools/repopick.py  -P frameworks/av -f 286170 286171

## hardware/libhardware
./vendor/lineage/build/tools/repopick.py  -P hardware/libhardware -f 286177

## hardware/libhardware_legacy
./vendor/lineage/build/tools/repopick.py  -P hardware/libhardware_legacy 286178

## packages/apps/ThemePicker
./vendor/lineage/build/tools/repopick.py -f 286365

## system/core
./vendor/lineage/build/tools/repopick.py -f 286235 286236

