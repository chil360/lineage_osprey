#!/bin/bash

#################################################################
# DEFINES (*** DO NOT MODIFY ***)                               #
#################################################################

TOP=${PWD}
source $TOP/build/envsetup.sh > /dev/null 2>&1
PATCH_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

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
apply_patch hardware/qcom-caf/wlan 0001-wifi-build-fix-for-S.patch

# Misc
apply_patch vendor/lineage 0001-TEMP-Disable-ADB-authentication.patch

# Workaround BFP
apply_patch system/bpf 0001-bpfloader-No-BPF.patch
apply_patch system/netd 0001-netd-No-BPF.patch

# Display 8916
apply_patch hardware/qcom-caf/msm8916/display 0001-HWC-HAXX.patch

# frameworks/base SDCard fixes
apply_patch frameworks/base 0001-storage-Set-all-sdcards-to-visible.patch
apply_patch frameworks/base 0001-Correction-in-logic-of-roundend-size-calculation-of-.patch

# HAL1 Hackery
apply_patch frameworks/av 0001-MediaMuxer-HAX.patch
apply_patch frameworks/av 0001-Camera-Restore-camera-HALv1-support-1-2.patch
apply_patch frameworks/base 0001-Camera-Restore-camera-HALv1-support-2-2.patch

# gralloc usage bits
apply_patch frameworks/native 0001-libui-Allow-extension-of-valid-gralloc-1.0-buffer-us.patch

# eleven-qcom-cam
apply_patch frameworks/av 0001-Camera-CameraHardwareInterface-changes-to-support-Ex.patch
apply_patch frameworks/av 0002-Camera-Miscellaneous-fixes-in-QDataCallback-and-bind.patch
apply_patch frameworks/av 0003-camera-Only-link-and-use-vendor.qti.hardware.camera..patch
apply_patch hardware/interfaces 0001-Camed-HAL-extension-Added-support-in-HIDL-for-Extend.patch
apply_patch hardware/interfaces 0002-camera-Only-link-and-use-vendor.qti.hardware.camera..patch
apply_patch system/core 0001-Camera-Add-feature-extensions.patch

# eleven-camera-extension
apply_patch frameworks/av 0001-Camera-Add-extensions-to-CameraClient.patch
apply_patch frameworks/av 0002-Camera-Add-support-for-preview-frame-fd.patch
apply_patch frameworks/base 0002-Camera-Add-feature-extensions.patch

# eleven-legacy-camera
apply_patch frameworks/av 0001-nuplayer-Avoid-crash-when-codec-fails-to-load.patch
apply_patch frameworks/av 0002-camera-Don-t-segfault-if-we-get-a-NULL-parameter.patch
apply_patch frameworks/av 0003-libstagefright-Support-YVU420SemiPlanar-camera-forma.patch
apply_patch frameworks/av 0004-stagefright-omx-Don-t-signal-dataspace-change-on-leg.patch
apply_patch frameworks/av 0005-stagefright-ACodec-Resolve-empty-vendor-parameters-u.patch
apply_patch frameworks/av 0006-libstagefright-Free-buffers-on-observer-died.patch
apply_patch frameworks/av 0007-libstagefright-use-64-bit-usage-for-native_window_se.patch
apply_patch frameworks/av 0008-camera-include-Don-t-override-possible-overlayed-hea.patch
apply_patch frameworks/av 0009-camera-media-Support-legacy-HALv1-camera-in-mediaser.patch
apply_patch frameworks/av 0010-Camera-check-metadata-type-before-releasing-frame.patch
apply_patch frameworks/av 0011-libstagefright-Fix-memory-leak-due-to-lock-timeout.patch
apply_patch frameworks/av 0012-camera-Allow-devices-to-load-custom-CameraParameter-.patch
apply_patch frameworks/base 0001-CameraServiceProxy-Loosen-UID-check-conditionally.patch
apply_patch vendor/lineage 0001-soong-Update-camera_in_mediaserver_defaults.patch
