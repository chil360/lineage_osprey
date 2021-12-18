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

# Misc
apply_patch vendor/lineage 0001-TEMP-Disable-ADB-authentication.patch

# Display 8916
apply_patch hardware/qcom-caf/msm8916/display 0001-HWC-HAXX.patch

# Themed icons
apply_patch packages/apps/Trebuchet 0001-launcher-Add-support-for-themed-icons.patch
apply_patch packages/apps/Trebuchet 0002-Launcher3-Import-more-themed-icons.patch

# Camera blobs
apply_patch frameworks/av 0001-MediaMuxer-HAX.patch
