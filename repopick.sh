#!/bin/bash

#################################################################
# DEFINES (*** DO NOT MODIFY ***)                               #
#################################################################

TOP=${PWD}
source $TOP/build/envsetup.sh > /dev/null 2>&1

#################################################################
# CHERRYPICKS                                                   #
#                                                               #
# Examples:                                                     #
# repopick [CHANGE_NUMBER]                                      #
#################################################################

# Ultra Legacy
repopick -P art 318097
repopick -f 287706 -P external/perfetto
repopick 318458
repopick -P system/bpf 320591
repopick -P system/netd 320592

# build
repopick 317298 317300

# hardware/qcom/wlan
repopick 318781

# packages/apps/Etar
repopick 319630-319634

# packages/apps/Settings
repopick 318021 318022 318023

# packages/apps/Trebuchet
repopick 317966-317971 318383-318386 318388

# frameworks/base
repopick 318459 318605

# packages/apps/SetupWizard
#repopick 317569-317570 317810 317948 318019

# system/tools/mkbootimg
repopick -P system/tools/mkbootimg 319780

# Gralloc usage bits
repopick 320524

# Camera
repopick -t twelve-restore-camera-hal1
repopick -t twelve-camera-extension
repopick 320528-320530                              # twelve-qcom-cam
repopick -P hardware/interfaces 320531-320532       # twelve-qcom-cam
repopick -t twelve-legacy-camera

# Extras
repopick 318826 318828
#repopick -t twelve-clock-customizations
#repopick -t twelve-network-traffic
#repopick -t twelve-monet
repopick 320514
repopick -t twelve-legacy-wfd