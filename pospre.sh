#!/bin/sh

user=mark
passwd="240492"
echo "$passwd" | sudo -S usermod -aG sudo $user
echo "$user ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
# sudo passwd -d $user
groups $user

content="deb http://deb.debian.org/debian/ trixie contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian/ trixie contrib main non-free non-free-firmware

deb http://security.debian.org/debian-security trixie-security contrib main non-free non-free-firmware
deb-src http://security.debian.org/debian-security trixie-security contrib main non-free non-free-firmware

deb http://deb.debian.org/debian/ trixie-updates contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian/ trixie-updates contrib main non-free non-free-firmware"

echo "$content" | sudo tee /etc/apt/sources.list >/dev/null

sudo apt update
sudo apt upgrade
sudo apt install -y \
  libffi-dev libx11-dev libxinerama-dev autoconf \
  automake build-essential git-core libass-dev libfreetype6-dev \
  libgnutls28-dev libmp3lame-dev libsdl2-dev libtool libva-dev \
  libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev meson \
  ninja-build pkg-config texinfo wget yasm zlib1g-dev libunistring-dev libaom-dev libdav1d-dev \
  libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc libxft-dev libreadline-dev \
  zenity wmctrl xbindkeys xdotool preload xsel rofi \
  nginx \
  vlc \
  ibus ibus-pinyin ibus-unikey ibus-kkc \
  flameshot \
  clang

# echo 'eval "$(mise activate bash)"' >>~/.bashrc
# mise up
