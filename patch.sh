#!/bin/sh

TOP=${PWD}
echo "TOP: $TOP"

. build/envsetup.sh

#############################################################
# PATCHES                                                   #
#############################################################


#############################################################
# CHERRYPICKS                                               #
#############################################################

# Example: repopick [CHANGE_NUMBER]

### Sepolicy
repopick -P system/sepolicy 264406

### frameworks/av
repopick -g https://review.arrowos.net/ -f -P frameworks/av -t ten-aosp-wfd

