
TOP=${PWD}
. build/envsetup.sh

#############################################################
# PATCHES                                                   #
#############################################################

cd vendor/lineage
git am -3 $TOP/0001-DNM-Allow-insecure-ADB.patch
cd $TOP

cd system/qcom
git am -3 $TOP/0001-DNM-libqsap_sdk-Suppress-warnings.patch
cd $TOP

cd device/motorola/msm8916-common
git am -3 $TOP/0001-DO-NOT-MERGE-msm8916-common-Force-battery-led-off.patch
cd $TOP

cd hardware/qcom/bt-caf
git am -3 $TOP/0001-DNM-libbt-vendor-Suppress-warnings.patch
cd $TOP

#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: repopick [CHANGE_NUMBER]
# android_build
repopick 222733 222761 222760 222754 222750 222762 222809

# android_build_soong
repopick 223431 222682

# android_bionic
repopick 223065 223067

# android_bootable_recovery
repopick 222993 222994 222995 222996 222997 222998

# android_external_perfetto
repopick 223413

# android_external_tinycompress
repopick 225762-225763 223008 223011;

# android_frameworks_av
repopick 224863 224174 224176 224177 224178 224179 224180 224181 224182 224183 224184 224173

# android_frameworks_compile_mclinker
repopick 222683

# android_frameworks_opt_telephony
repopick 223774

# android_hardware_libhardware
repopick 223096 223097

# android_hardware_libhardware_legacy
repopick 225716 223521;

# android_hardware_ril
repopick 224063 225247;

# hardware/ril-caf
repopick 225738-225739;

# android_packages_services_Telecomm
repopick 223099

# android_system_bt
repopick 223945 224813

# android_system_core
repopick 223085 223500 224264

# android_system_sepolicy
repopick 223745 223746 223748

# android_vendor_lineage
repopick 223890 224758 226155

# android_hardware_qcom_audio
repopick -t 8916-audio-p

# android_hardware_qcom_display
repopick -t 8916-display-p

# android_hardware_qcom_media
repopick -t 8916-media-p

# android_hardware_qcom_power
repopick 223892

# android_hardware_qcom_fm
repopick 223678 223683 223684 223685 223686 223687 223692 223688 224246 224386

# android_packages_apps_FMRadio
repopick 223676 223677

repopick -t pie-caf-namespaces
repopick -t pie-gralloc_10_usage_bits

# Basic USB HAL
repopick 224525

