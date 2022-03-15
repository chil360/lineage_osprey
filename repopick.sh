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
repopick -P art -f 318097
repopick -P external/perfetto -f 287706
repopick 321934 326385
repopick -P system/bpf -f 320591
repopick -P system/netd -f 320592

# frameworks/av
repopick 320337

# frameworks/base
repopick 326377 326379

# Camera
repopick -t twelve-restore-camera-hal1
repopick -t twelve-camera-extension
repopick 320528-320530                              # twelve-qcom-cam
repopick -P hardware/interfaces 320531-320532       # twelve-qcom-cam
repopick -t twelve-legacy-camera

# Extras
repopick 320514
repopick -f 326552
repopick 325894
