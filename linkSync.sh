#!/bin/sh

user="mark"
# pass="240492"

compare_link() {
  if [ -L "$1" ] && [ "$(readlink "$1")" = "$2" ]; then
    printf "SUCCESSFULLY: %s => %s.\n" "$1" "$2"
    return 0
  else
    printf "WARNING: %s not link to target." "$1"
    return 1
  fi
}

# if compare_link return 1 then run fix
# create a parent function to contain compare_link and fix method, then only call it will work
#
fix_link() {
  printf "Try to fix link. Processing...\n"
  sudo ln -sf "$2" "$1"
  printf "Link is fixed. Please try test to ensure working\n"
}

run_scan() {
  compare_link "$1" "$2"
  testResult=$?
  if [ $testResult -eq 1 ] && [ "$2" ]; then
    fix_link "$1" "$2"
  fi
}

if [ ! -d "$HOME/mydotfile" ]; then
  su -c "git clone https://github.com/marknguyenanl/mydotfile $HOME/mydotfile" $user
fi

mkdir -p "$HOME/.config/fish"
run_scan "$HOME/.config/fish/config.fish" "$HOME/mydotfile/installsh/plugins/fish/config.fish"

run_scan "/usr/bin/gh" "$(mise which gh)"

run_scan "/usr/bin/python3" "$(mise which python3)"

mkdir -p "$HOME/.config/gitui"
run_scan "$HOME/.config/gitui/key_bindings.ron" "$HOME/mydotfile/installsh/plugins/gitui/key_bindings.ron"

run_scan "$HOME/.config/nvim" "$HOME/mydotfile/.config/nvim"

mkdir -p "$HOME/.config/mise"
run_scan "$HOME/.config/mise/config.toml" "$HOME/core/mise-config.toml"

run_scan "/usr/bin/nvim" "$(mise which nvim)"

run_scan "$HOME/.Xmodmap" "$HOME/mydotfile/installsh/plugins/remapping/.Xmodmap"

run_scan "/usr/bin/node" "$(mise which node)"

run_scan "/usr/bin/kubectl" "$(mise which kubectl)"

run_scan "/usr/bin/starship" "$(mise which starship)"

run_scan "/usr/bin/joplin" "$(mise which joplin)"
mkdir -p "$HOME/.config/joplin"
run_scan "$HOME/.config/joplin/keymap.json" "$HOME/mydotfile/installsh/plugins/joplin/keymap.json"
run_scan "$HOME/.config/joplin/settings.json" "$HOME/mydotfile/installsh/plugins/joplin/settings.json"
