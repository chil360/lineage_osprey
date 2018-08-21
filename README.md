
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

What's not working?
 - Camera HDR
 - Volte
 - Probably more!

Download
--------

My current builds are available [here](https://mega.nz/#F!3F9CTSrQ!ZBLcFw1Mh_47FdxiZ2LYyg!uYlmhBKT).

Build Instructions
------------------
Create a build directory

	mkdir lineage
	cd lineage

Initialize your local repository using the LineageOS trees, use a command like this:

    repo init -u git://github.com/LineageOS/android.git -b lineage-16.0

Create 'local_manifests' folder and copy my local manifest 'osprey.xml' to the 'local_manifests' directory
by just ctrl+c and ctrl+v this:
```
curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.githubusercontent.com/chil360/lineage_osprey/lineage-16.0/osprey.xml

Then to sync up:

    repo sync -c -f --force-sync

OR, for those with limited bandwidth/storage:

    repo sync -c -f --no-clone-bundle --no-tags --force-sync --optimized-fetch --prune

Currently I a use a few patches for development reasons and to fix a couple of compile issues. Copy patch.sh and the .patch files from this repo to the root of your build folder. Then run the patch.sh script to apply.

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
