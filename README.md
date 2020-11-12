
Lineage 18.0 for Osprey
=======================

Current Status
--------------

What's working ?
 - It boots!
 - Wifi
 - RIL
 - Mobile Data
 - Audio
 - Camera
 - Bluetooth
 - Camcorder
 - GPS
 - Media support
 - VoLTE
 - SELinux Enforcing

Not Working / Not Tested ?
 - Safetynet

Download
--------

It's not ready for public testing so no builds are availble to download at present.
Builds will available [here](https://chil360.github.io/) when it's ready for public testing.

Build Instructions
------------------
Create a build directory

	mkdir lineage
	cd lineage

Initialize your local repository using the LineageOS trees, use a command like this:

    repo init -u git://github.com/LineageOS/android.git -b lineage-18.0

Now create a local_manifests directory

    mkdir .repo/local_manifests

Copy my local manifest 'osprey.xml' to the 'local_manifests' directory.

Then to sync up:

    repo sync -c --force-sync

OR, for those with limited bandwidth/storage:

    repo sync -c --no-clone-bundle --no-tags --force-sync --optimized-fetch --prune

Apply any required patches:

    Copy patch.sh and the .patch files from this repo to the root of your build folder. Then run the patch.sh script to apply.	


Now start the build...

```bash
# Go to the root of the source tree...
$
# ...and run to prepare our devices list
$ . build/envsetup.sh
# ... now run
$ brunch osprey
```

Please see the [LineageOS Wiki](https://wiki.lineageos.org/) for further information.
