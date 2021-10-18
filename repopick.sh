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

# art
vendor/lineage/build/tools/repopick.py -f 286185

# bionic
vendor/lineage/build/tools/repopick.py 317618

# bootable/recovery
vendor/lineage/build/tools/repopick.py -f 286438 -P bootable/recovery

# build
vendor/lineage/build/tools/repopick.py -p 317301
vendor/lineage/build/tools/repopick.py 317296

# build/soong
vendor/lineage/build/tools/repopick.py -p 317934

# device/lineage/sepolicy
vendor/lineage/build/tools/repopick.py -p 317361

# external/perfetto
vendor/lineage/build/tools/repopick.py -f 287706 -P external/perfetto

# external/tinycompress
vendor/lineage/build/tools/repopick.py 317792 317793

# hardware/libhardware
vendor/lineage/build/tools/repopick.py -f 317795 286147 287794

# hardware/lineage/interfaces
vendor/lineage/build/tools/repopick.py 317295 317362

# lineage-sdk
vendor/lineage/build/tools/repopick.py -t twelve-sdk-bringup -e 317384
vendor/lineage/build/tools/repopick.py -t twelve-sdk-system_ext
vendor/lineage/build/tools/repopick.py -t twelve-sdk-audio

# packages/apps/Etar
vendor/lineage/build/tools/repopick.py 317686 317685

# packages/apps/LineageParts
vendor/lineage/build/tools/repopick.py -p 317606

# packages/apps/Settings
vendor/lineage/build/tools/repopick.py 317139

# packages/apps/SettingsIntelligence
vendor/lineage/build/tools/repopick.py 317614 317615

# system/core
vendor/lineage/build/tools/repopick.py 317617

# vendor/lineage
vendor/lineage/build/tools/repopick.py 317189


vendor/lineage/build/tools/repopick.py 317935 317936
vendor/lineage/build/tools/repopick.py 317608
vendor/lineage/build/tools/repopick.py 317609
vendor/lineage/build/tools/repopick.py 317568-317570 317804 317810 317948

# Updater
vendor/lineage/build/tools/repopick.py 317814 317815 317816 317955 318005
vendor/lineage/build/tools/repopick.py 317920 317914
vendor/lineage/build/tools/repopick.py 317819
