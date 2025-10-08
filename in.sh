#!/usr/bin/env bash

echo -e "\nInstalling essential packages..."
pkg install git age gum -y

gum spin --spinner dot --spinner.foreground 81 --title "Cloning nix repo..." --title.foreground 254 -- sleep 1

git clone "https://github.com/nejuni/nix.git" ~/.local/share/nix >/dev/null

# Main script execution
source ~/.local/share/nix/install/ins.sh