#!/usr/bin/env bash

echo -e "\nInstalling essential packages..."
pkg install git gnupg gum -y

gum spin --spinner dot --spinner.foreground 81 --title "Cloning nix repo..." --title.foreground 254 -- sleep 1

git clone "https://github.com/nejuni/nix.git" ~/.local/share/nix >/dev/null

chmod +x ~/.local/share/nix/st.sh

gum style "~/.local/share/nix/st.sh
" --foreground 254 --bold --padding "2 14" --border normal --border-foreground 81