#!/bin/sh

iPlugin() {
  for plugin in "$@"; do
    sh "$HOME/mydotfile/installsh/plugins/$plugin.sh"
  done
}

iPlugin \
  fish docker calcurse flatpak nvimTmpRam joplin-client auto-cpufreq dwm st gitui
