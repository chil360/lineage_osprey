
TOP=${PWD}
. build/envsetup.sh

#############################################################
# PATCHES                                                   #
#############################################################

cd system/qcom
git am -3 $TOP/0001-DNM-libqsap_sdk-Suppress-warnings.patch
cd $TOP

#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: repopick [CHANGE_NUMBER]

# android_hardware_interfaces
repopick 225506 225507

# android_system_bt
repopick 223945 225422 225423 230382

# android_system_core
repopick 223085

# android_system_sepolicy
repopick 223748 230151 230613

# android_hardware_qcom_audio
repopick -t 8916-audio-p -e 227566

# android_hardware_qcom_display
repopick -t 8916-display-p

# android_hardware_qcom_media
repopick -t 8916-media-p

# android_hardware_qcom_wlan
repopick 226638 226643

# android_hardware_qcom_fm
repopick -p 226740

# android_frameworks_base
repopick 226615

# Styles
repopick -t pie-styles -e 225583,225755,230520
