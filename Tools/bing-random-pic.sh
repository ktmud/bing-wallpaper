#!/usr/bin/env bash
# -*- coding: utf8 -*-

# Author: Hwasung Lee

# This script downloads and links Bing's pictures to a fixed link.
#
# This script does three functions:
#   1. Execute bing-wallpaper script to download today's random picture.
#   2. Link it to $PICTURE_DIR/today.jpg
#   3. Randomly select a picture from $PICTURE_DIR/ that is not today's picture
#      and link it to $PICTURE_DIR/random.jpg
#
# Usage examples: (1) If the desktop background is set to $PICTURE_DIR/today.jpg
# this script will ensure it is always today's bing picture. (2) A Gnome
# slideshow can be setup to rotate between today.jpg and random.jpg. Look at the
# tools under gnome-bing-slideshow/


# If an error occurs, give up and terminate.
set -e

SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
BING_SCRIPT="${SCRIPT_DIR}/../bing-wallpaper.sh"

echo 'Running the bing-wallpaper script and loading settings.'
# NOTE: $PICTURE_DIR and $filename is sourced from bing-wallpaper.sh
source ${BING_SCRIPT}

echo 'Removing today.jpg and random.jpg to ensure no symlink error occurs.'
rm "${PICTURE_DIR}/today.jpg" "${PICTURE_DIR}/random.jpg"

echo "Linking today's Bing wallpaper to today.jpg."
ln -s -f "${PICTURE_DIR}/${filename}" "${PICTURE_DIR}/today.jpg"

echo 'Randomly selecting a picture and linking it to random.jpg'
ln -s -f $(ls ${PICTURE_DIR}/*_*.jpg | grep -v ${filename} | shuf -n 1) \
  "${PICTURE_DIR}/random.jpg"
