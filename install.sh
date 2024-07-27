#!/bin/sh

iPlugin() {
  for plugin in "$@"; do
    sh "$HOME/mydotfile/installsh/plugins/$plugin.sh"
  done
}

mkdir -p $HOME/joplin-server/newNotes

iPlugin \
  fish docker calcurse flatpak nvimTmpRam
