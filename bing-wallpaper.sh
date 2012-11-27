#!/usr/bin/env bash

###
# Requires wget; use homebrew if not installed
###

PICTURE_DIR="$HOME/Pictures/bing-wallpapers/"

mkdir -p $PICTURE_DIR

urls=( $(curl -s http://www.bing.com|grep -Eo "url:'.*?'"|sed -e "s/url:\'\(.*\)\'/http:\/\/bing.com\1/"|sed -e "s/\\\//g") )

for p in ${urls[@]}; do
    filename=$(echo $p|sed -e "s/.*%2f\(.\)/\1/")
    if [ ! -f $PICTURE_DIR/$filename ]; then
        echo "Downloading: $filename ..."
        wget -q -O $PICTURE_DIR/$filename $p
    else
        echo "Skipping: $filename ..."
    fi
done
