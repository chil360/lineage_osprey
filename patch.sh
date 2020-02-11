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

### Fixes & Features
repopick -t ten-visualizer

### Sepolicy
repopick -P system/sepolicy 264406

