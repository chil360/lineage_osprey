
Lineage 16.0 for Osprey
=======================

Current Status
--------------

What's working?
 - It boots!
 - RIL
 - Mobile data
 - Wifi
 - Bluetooth
 - GPS
 - Camera (apart from HDR)
 - Camcorder
 - Camera HDR (Now working in Snap)
 - SELinux Enforcing
 - VoLTE (credits to @nicorg2515)

Download
--------

My current builds are available [here](https://chil360.github.io/).

Build Instructions
------------------
Create a build directory

	mkdir lineage
	cd lineage

Initialize your local repository using the LineageOS trees, use a command like this:

    repo init -u git://github.com/LineageOS/android.git -b lineage-16.0

Now create a local_manifests directory

    mkdir .repo/local_manifests

Copy my local manifest 'osprey.xml' to the 'local_manifests' directory.

Then to sync up:

    repo sync -c -f --force-sync

OR, for those with limited bandwidth/storage:

    repo sync -c -f --no-clone-bundle --no-tags --force-sync --optimized-fetch --prune

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
