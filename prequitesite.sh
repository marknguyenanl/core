#!/bin/sh

user=mark
passwd="240492"
echo "$passwd" | sudo -S usermod -aG sudo $user
echo "$user ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
# sudo passwd -d $user
groups $user

content="deb http://mirror.bizflycloud.vn/debian/ trixie contrib main non-free non-free-firmware
deb-src http://mirror.bizflycloud.vn/debian/ trixie contrib main non-free non-free-firmware

deb http://mirror.bizflycloud.vn/debian/ trixie-updates contrib main non-free non-free-firmware
deb-src http://mirror.bizflycloud.vn/debian/ trixie-updates contrib main non-free non-free-firmware"

echo "$content" | sudo tee /etc/apt/sources.list >/dev/null

sudo apt update
sudo apt upgrade
sudo apt install \
  libffi-dev libx11-dev libxinerama-dev autoconf \
  automake build-essential git libass-dev libfreetype-dev \
  libgnutls28-dev libmp3lame-dev libsdl2-dev libtool libva-dev \
  libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev meson \
  ninja-build pkg-config texinfo wget yasm zlib1g-dev libunistring-dev libaom-dev libdav1d-dev \
  zlib1g-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc libxft-dev libreadline-dev \
  zenity wmctrl xbindkeys xdotool preload xsel rofi \
  nginx \
  vlc \
  ibus ibus-pinyin ibus-unikey ibus-kkc \
  flameshot \
  clang \
  gcc \
  rsync -y

echo 'eval "$(mise activate bash)"' >>~/.bashrc
mise up

miseSetting="[tools]
node = "18.18.0"
bun = 'latest'
yarn = 'latest'

neovim = 'ref:master'
git = 'latest'
gitui = 'latest'
github-cli = '2.52.0'
lua = 'latest'
luajit = 'latest'

dotnet = 'latest'
go = 'latest'
python = "3.12.4"
rust = 'latest'
ruby = '3.1.0'

dockle = 'latest'
helm = 'latest'
kubectl = '1.28.10'
kubie = 'latest'
kustomize = ' latest'
kubelogin = 'latest'
kops = 'latest'
kind = 'latest'
minikube = 'latest'
argo = 'latest'
argocd = "2.11.7"
azure-cli = 'latest'
terraform = 'latest'

ripgrep = 'latest'
fd = 'latest'
tree-sitter = 'latest'
glab = 'latest'
starship = "latest"
deno = "latest"

'npm:degit' = 'latest'
'npm:joplin' = 'latest'
'cargo:clock-cli' = 'latest'

[tasks.cleancache]
alias = "c"
run = "rm -rf .cache"
hide = false
[tasks.update]
depends = ["cleancache"]
alias = "u"
run = "mise up"
hide = false

# [env]
# _.python.venv = "~/venv"
# _.python.venv = { path = "{{env.HOME}}/venv", create = true }

[settings]
legacy_version_file = false
always_keep_download = false
always_keep_install = false
plugin_autoupdate_last_check_duration = '1 week'
trusted_config_paths = ['~/.config/mise/config.toml']
verbose = false
asdf_compat = true
http_timeout = 120
jobs = 20
raw = false
yes = true
not_found_auto_install = true
task_output = 'prefix'
paranoid = false
disable_default_shorthands = false
experimental = true
status = { missing_tools = 'if_other_versions_installed', show_env = false, show_tools = false }
python_compile = false"

mkdir -p $HOME/.config/mise/
echo "$miseSetting" >$HOME/.config/mise/config.toml
