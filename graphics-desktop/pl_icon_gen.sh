#!/bin/bash

mydir="$(dirname "$(realpath "$0")")"

file="$1"

# Generate favicon & icon 
dest_folder="$mydir/../build/icons"

for w in 16 24 48 64 96 128 256 512
do
  convert "$mydir/plcomms_icon_orig.png" -resize "$wx$w" "$dest_folder/${w}x$w.png"
done

dest_folder="$mydir/../build"
convert "$mydir/icon_256.ico" "$dest_folder/icon.ico"
cp "$mydir/icon.icns" "$dest_folder/icon.icns"
convert "$mydir/install-spinner.gif" "$dest_folder/install-spinner.gif"

#Generate icon for Docker build (Linux)
dest_folder="$mydir/../res/img"
convert "$mydir/icon_256.ico" "$dest_folder/element.ico"
convert "$mydir/icon_256.ico" "$dest_folder/plcomms.ico"
convert "$mydir/plcomms_icon_orig.png" -resize "256x256" "$dest_folder/element.png"
convert "$mydir/plcomms_icon_orig.png" -resize "256x256" "$dest_folder/plcomms.png"
