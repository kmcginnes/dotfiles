#!/bin/bash
##########################################################
# sabnzbd script that runs both sabToSickbeard 
# and Mkv conversion.
#
# @author: Ticean Bennett
# @see: http://ticean.com
# @see: http://wiki.sabnzbd.org/user-scripts
# @requires: sabToSickbeard.py
# @requires: convertMkv.sh
#
# @param $l directory of the job (full path)
# @param $2 The original name of the NZB file
# @param $3 Clean version of the job name (no path info and ".nzb" removed)
# @param $4 Indexer's report number (if supported)
# @param $5 User-defined category
# @param $6 Group that the NZB was posted in e.g. alt.binaries.x
# @param $7 Status of post processing. 0 = OK, 1=failed verification, 2=failed unpack, 3=1+21
#
###########################################################

scriptpath="$(cd ${0%/*} && pwd -P)"

"${scriptpath}/convertMkv" "$1" "$2" "$3" "$4" "$5" "$6" "$7"

"${scriptpath}/sabToSickBeard.py" "$1" "$2" "$3" "$4" "$5" "$6" "$7"