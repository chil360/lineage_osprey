
Lineage 15.1 for Osprey
=======================

Current Status
--------------

What's working?
 - Bluetooth
 - Camera
 - Camcorder
 - RIL
 - WiFi
 - Storage
 - 4G
 - VoLTE

What's not working?
 - Selinux Enforcing

Download
--------

My current builds are available [here](https://mega.nz/#F!3F9CTSrQ!ZBLcFw1Mh_47FdxiZ2LYyg).

Build Instructions
------------------
Create a build directory

	mkdir lineage
	cd lineage

Initialize your local repository using the LineageOS trees, use a command like this:

    repo init -u git://github.com/LineageOS/android.git -b lineage-15.1

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
