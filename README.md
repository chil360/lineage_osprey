Lineage 15.1 for Osprey
=======================


Sync using my local manifest 'osprey.xml' then run 'cherrypick.sh' to repopick the required changes from the LineageOS gerrit.

Also, just found that I still had a hack in place to hardware/qcom/media-caf/msm8916/mm-video-v4l2/vidc/venc/src/omx_video_base.cpp
See omx_video_base.cpp line 3632 -> 3639 which comments out the call for color alignment.
This hack avoids the 'OMX-VENC: Failed to align Chroma' error seen in logcat.
