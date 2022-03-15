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

# Themed icons
apply_patch packages/apps/Trebuchet 0001-launcher-Add-support-for-themed-icons.patch
apply_patch packages/apps/Trebuchet 0002-Launcher3-Import-more-themed-icons.patch

# Davey logspam
apply_patch frameworks/base 0001-hwui-Silence-Davey-logs-for-now.patch

# Legacy telephony stuff
apply_patch frameworks/opt/telephony 0001-telephony-Squashed-support-for-simactivation-feature.patch
apply_patch frameworks/opt/telephony 0002-Avoid-SubscriptionManager-getUriForSubscriptionId-ca.patch
apply_patch frameworks/opt/telephony 0003-RIL-Fix-manual-network-selection-with-old-modem.patch
apply_patch frameworks/opt/telephony 0004-2G-wants-proper-signal-strength-too.patch
apply_patch frameworks/opt/telephony 0005-Telephony-Add-option-for-using-regular-poll-state-fo.patch


# System sepolicy
apply_patch system/sepolicy 0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after-.patch
apply_patch system/sepolicy 0002-sepolicy-Treat-proc-based-DT-fstab-the-same-and-sys-.patch
apply_patch system/sepolicy 0003-Allow-init-to-write-to-proc-cpu-alignment.patch
