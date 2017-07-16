#!/bin/bash
#
# Author        :Julio Sanz
# Website       :www.elarraydejota.com
# Email         :juliojosesb@gmail.com
# Description   :Script to record video/audio with ffmpeg
# Dependencies  :pulseaudio, ffmpeg
# Usage         :./record.sh filename format
# License       :GPLv3
#

#
# VARIABLES
#

format="$2"
# You can get a list of available resolutions in your desktop with "xrandr" command
resolution=$(xrandr | awk -F "current" '{print $2}' | head -1 | cut -d "," -f1 | tr -d " ")
# input_audio can change depending on the system, check "pactl list sources" command for the right output device
# that needs to be redirected as input for ffmpeg (usually the one with 'monitor' suffix)
input_audio="alsa_output.pci-0000_00_1b.0.analog-stereo.monitor"
video_framerate="40"
video_folder="recorded_video"
audio_folder="recorded_audio"
record_file="$1_$(date +%Y%m%d%S).${format}"
v_display="$DISPLAY"

#
# FUNCTIONS
#

record_mp4(){
    echo " >> Recording video and audio, press Ctrl+C or 'q' to finish"
    ffmpeg -loglevel fatal \
        -thread_queue_size 512 \
        -f pulse \
        -i $input_audio \
        -f x11grab \
        -r $video_framerate \
        -s $resolution \
        -i $v_display \
        -vcodec libx264 \
        -preset ultrafast \
        -strict experimental \
        -y $video_folder/$record_file
}

record_mp3(){
    echo " >> Recording mp3 audio, press Ctrl+C or 'q' to finish"
    ffmpeg -loglevel fatal \
        -f pulse \
        -i $input_audio \
        -acodec libmp3lame \
        -qscale:a 4 \
        -y $audio_folder/$record_file
}

record_ogg(){
    echo " >> Recording ogg audio, press Ctrl+C or 'q' to finish"
    ffmpeg -loglevel fatal \
        -f pulse \
        -i $input_audio \
        -acodec libvorbis \
        -qscale:a 5 \
        -y $audio_folder/$record_file
}

record_wav(){
    echo " >> Recording wav audio, press Ctrl+C or 'q' to finish"
    ffmpeg -loglevel fatal \
        -f pulse \
        -i $input_audio \
        -y $audio_folder/$record_file
}

how_to_use(){
    echo "Usage: $0 filename format"
    echo "Record video/audio in filename with the specified format"
    echo ""
    echo "Options for format:"
    echo "  -mp3         Record audio in mp3 format"
    echo "  -ogg         Record audio in ogg format"
    echo "  -wav         Record audio in wav format"
    echo "  -mp4         Record video and audio in mp4 format"
    echo ""
    echo "Example: ./record.sh myfirstvideo mp4"
}

#
# MAIN
#

if [ $# -ne 2 ];then
    how_to_use
else
    case $format in
        "mp4") record_mp4 ;;
        "mp3") record_mp3 ;;
        "ogg") record_ogg ;;
        "wav") record_wav ;;
        *) how_to_use ;;
    esac
fi