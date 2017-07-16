#!/bin/bash
#
# Author        :Julio Sanz
# Website       :www.elarraydejota.com
# Email         :juliojosesb@gmail.com
# Description   :Format conversor
# Dependencies  :ffmpeg
# License       :GPLv3
#

fullfilename=$(basename "$1")
justfilename="${fullfilename%.*}"
currentfolder=$(dirname $0)

echo " >> Making conversion, please wait..."

ffmpeg -i "$1" -loglevel error -codec copy $currentfolder/../converted/"$justfilename".avi

echo " >> Conversion finished, press ENTER to close this terminal"
read v_key