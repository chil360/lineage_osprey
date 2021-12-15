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

repopick -t android-12.0.0_r16

# Ultra Legacy
repopick 318097
repopick -f 287706 -P external/perfetto
repopick 318458

# build
repopick 317298 317300

# hardware/qcom/wlan
repopick 318781

# packages/apps/Etar
repopick 319630-319634

# packages/apps/Settings
repopick 318021 318022 318023 319084

# packages/apps/Trebuchet
repopick 317966-317971 318383-318386 318388

# frameworks/base
repopick 318459 318605

# packages/apps/SetupWizard
repopick 317569-317570 317810 317948 318019

# system/tools/mkbootimg
repopick -P system/tools/mkbootimg 319780

# Camera
repopick -t twelve-camera-extension

# vendor/codeaurora/telephony
repopick 320322

# Extras
repopick 317928 317929 317932 318826 318828
#repopick -t twelve-clock-customizations
#repopick -t twelve-network-traffic
#repopick -t twelve-monet
repopick -g https://review.arrowos.net/ -P frameworks/native -f 15028
repopick -g https://review.arrowos.net/ -P frameworks/av -f -t twelve-legacy-wfd