#!/usr/bin/env bash
# -*- coding: utf8 -*-

# Author: Hwasung Lee

# Register bing slideshows to Gnome desktop slideshows.
#
# This script registers a Gnome background slide show rotates between
#     Pictures/bing-wallpapers/today.jpg
# and
#     Pictures/bing-wallpapers/random.jpg
# Tested for Ubuntu versions 12.04 - 13.10.


# If an error occurs, give up and terminate.
set -e

SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"

echo 'Making .local/share directories.'
mkdir -p ${HOME}/.local/share/gnome-background-properties/
mkdir -p ${HOME}/.local/share/background/slideshows

echo 'Copying and registering bing slideshow to available desktop backgrounds.'
cp \
  ${SCRIPT_DIR}/dot_local/share/gnome-background-properties/bing-slideshow.xml \
  ${HOME}/.local/share/gnome-background-properties

echo 'Copying bing slideshow definition.'
cp \
  ${SCRIPT_DIR}/dot_local/share/background/slideshows/bing-today.xml \
  ${HOME}/.local/share/background/slideshows

