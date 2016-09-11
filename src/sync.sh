#!/bin/sh

set -e

readonly LOCK="/var/lock/vps-sync"

if [ ! -f "$LOCK" ]
then
    touch "$LOCK"
    trap 'rm -f "$LOCK"' EXIT
    rsync -arz  --delete --delete-after kimsufi:~/torrents/ /media/data/torrent
fi
