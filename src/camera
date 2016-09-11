#!/bin/sh

set -e

readonly CAMERA=${1:-cam1}
readonly DATE=${2:-$(date --date '1 day ago' '+%Y-%m-%d')}

function purge()
{
    local date=$(date --date '1 month ago' '+%Y-%m-%d')

    rm -f /media/data/archives/$date.mp4
}

cd /media/data/camera/$CAMERA
ffmpeg -pattern_type glob -i "$DATE/*.jpg" -framerate 12 -loglevel quiet \
    -codec:v libx264 -crf 18 -preset veryfast -codec:a libmp3lame -b:a 320k \
    ../archives/$CAMERA-$DATE.mp4
rm -rf $DATE
