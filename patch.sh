#!/bin/bash

#################################################################
# DEFINES (*** DO NOT MODIFY ***)                               #
#################################################################

TOP=${PWD}
source $TOP/build/envsetup.sh > /dev/null 2>&1
PATCH_DIR=$( dirname "${BASH_SOURCE[0]}" )

NOCOLOR='\033[0m'
GREEN='\033[0;32m'
LIGHTBLUE='\033[1;34m'

function apply_patch {
    echo ""
    echo -e "${GREEN}Applying patch...${NOCOLOR}"
    echo -e "${LIGHTBLUE}Target repo:${NOCOLOR} $1"
    echo -e "${LIGHTBLUE}Patch file:${NOCOLOR} $2"
    echo ""

    cd $1
    git am -3 --ignore-whitespace $PATCH_DIR/$2
    cd $TOP
    echo ""
}

#################################################################
# PATCHES                                                       #
#                                                               #
# Example: apply_patch [REPO_DIR] [PATCH_FILE]                  #
#################################################################

# Build Fixes
apply_patch system/tools/mkbootimg 0001-mkbootimg-add-support-for-dt.patch
apply_patch prebuilts/build-tools 0001-prebuilts-Update-xz-to-non-broken-version.patch
apply_patch vendor/lineage 0001-Hack-Generator.patch
apply_patch hardware/qcom-caf/wlan 0001-wifi-build-fix-for-S.patch
apply_patch bootable/recovery 0001-fixup-Bring-back-file-based-OTA-edify-functions.patch

# Misc
apply_patch bootable/recovery 0001-Disable-install_recovery-script.patch
apply_patch vendor/lineage 0001-TEMP-Disable-ADB-authentication.patch

# Workaround BFP
apply_patch system/bpf 0001-bpfloader-No-BPF.patch
apply_patch system/netd 0001-netd-No-BPF.patch

# Legacy ADB support
apply_patch packages/modules/adb 0001-adb-Bring-back-support-for-legacy-FunctionFS.patch

# Display 8916
apply_patch hardware/qcom-caf/msm8916/display 0001-HWC-HAXX.patch

# frameworks/base SDCard fixes
apply_patch frameworks/base 0001-storage-Set-all-sdcards-to-visible.patch
apply_patch frameworks/base 0001-Correction-in-logic-of-roundend-size-calculation-of-.patch