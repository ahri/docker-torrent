#!/bin/sh

set -ue

name=$(cat NAME)
version=$(cat VERSION)

docker run -d \
    --name torrent \
    --restart="always" \
    -p 9091:9091 \
    -v /mnt/download:/torrent/download \
    $name:$version
