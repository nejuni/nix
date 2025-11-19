#!/usr/bin/env bash

# Define nix locations used a variable
export NIX_PATH="$HOME/.local/share/nix"
export NIX_INSTALL="$NIX_PATH/enc-install"
export NIX_CONF="$HOME/.local/conf"

# Source function
source "$NIX_INSTALL/fu.sh"

# Decryption
cd $NIX_PATH
gpg -d -o enc-conf.tar enc-conf.tar.gpg
tar -xf enc-conf.tar
rsync -avh ~/.local/share/nix/enc-conf/ ~/.local/conf/
gpg --import "$NIX_CONF/gpg/"*.asc && gpg --import-ownertrust "$NIX_CONF/gpg/ownertrust.txt"

# Install
source "$NIX_INSTALL/config/all.sh"

# Check your summary by function
show_summary
