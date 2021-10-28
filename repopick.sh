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
vendor/lineage/build/tools/repopick.py 318097
vendor/lineage/build/tools/repopick.py -f 287706 -P external/perfetto
vendor/lineage/build/tools/repopick.py -f 291784 -P frameworks/base
vendor/lineage/build/tools/repopick.py 318364

# bionic
vendor/lineage/build/tools/repopick.py 317618

# bootable/recovery
vendor/lineage/build/tools/repopick.py 317820 317870

# build
vendor/lineage/build/tools/repopick.py -p 317301

# external/tinycompress
vendor/lineage/build/tools/repopick.py 317792 317793

# hardware/libhardware
vendor/lineage/build/tools/repopick.py -f 317795 286147 287794

# lineage-sdk
vendor/lineage/build/tools/repopick.py 318379 318380

# packages/apps/Etar
vendor/lineage/build/tools/repopick.py 317686 317685

# packages/apps/LineageParts
vendor/lineage/build/tools/repopick.py 317606

# packages/apps/Settings
vendor/lineage/build/tools/repopick.py 318021 318022 318023

# packages/apps/Trebuchet
vendor/lineage/build/tools/repopick.py 317966-317971 318383-318388

# system/core
vendor/lineage/build/tools/repopick.py 317617

# frameworks/base
vendor/lineage/build/tools/repopick.py 317608 317609

# packages/apps/SetupWizard
vendor/lineage/build/tools/repopick.py 317569-317570 317810 317948 318019

# Updater
vendor/lineage/build/tools/repopick.py 317955 318005
