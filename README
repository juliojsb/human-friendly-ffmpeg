Human Friendly FFmpeg
=======================

If you are tired of using long and complex commands to record audio/video or make conversions of formats with FFmpeg, this repository is for you:

* Record easily with script record.sh
* Convert formats with a simple drag & drop operation

## Requirements

* **Debian** or derivative distribution with **Gnome or Unity Desktop**
* Packages **ffmpeg** and **pulseaudio**. If you are using Debian you will have to enable deb-multimedia.org repository to install ffmpeg. In Ubuntu there should be no problem:

```bash
apt install ffmpeg pulseaudio
```

## Usage

### Record audio/video

If you want to record audio or video you can use the script **record.sh** which is in the main folder of this repository. Example usage:

```
./record.sh myvideo mp4
./record.sh mysong mp3
./record.sh mysong ogg
```

Videos recorded will be saved in the **recorded_video** folder. Audios are saved in **recorded_audio**

### Convert format (drag & drop)

You can convert between formats using the convert desktop scripts that are in the main folder of the repo. Those scripts will call the corresponding bash script in folder **conversion_scripts** to perform the operation.

All you have to do is drag the file (audio or video) and drop it in the desktop script you desire. The converted file will be saved in the **converted** folder

![convert_explained](https://user-images.githubusercontent.com/12804701/28250486-395f1594-6a6a-11e7-94a2-f75083d0700a.gif)

NOTE: do not drag & drop any file into the bash scripts that are inside conversion_scripts folder, the operation will not work. Use the desktop scripts explained before. If you just want to use the bash scripts, just launch them from the terminal passing the audio/video file as the first argument.