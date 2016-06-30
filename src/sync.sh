#!/bin/sh

set -e

readonly LOCK="/var/lock/vps-sync"

if test ! -f $LOCK
then
    touch $LOCK
    rsync -arz --delete --delete-after --partial-dir=/media/data/torrent/.partial --exclude='.*' kimsufi:~/torrents/ /media/data/torrent
    rm $LOCK
fi
