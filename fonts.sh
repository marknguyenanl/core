#!/bin/sh

mkdir -p $HOME/mydotfile/fonts
sudo cp $HOME/mydotfile/fonts/* /usr/share/fonts/
# update font cache
fc-cache -f -v
