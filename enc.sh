#!/usr/bin/env bash

export NIX_PATH="$HOME/.local/share/nix"
export NIX_INSTALL="$NIX_PATH/enc-install"
export NIX_CONF="$HOME/.local/dot"

source "$NIX_INSTALL/fu.sh"

cd "$NIX_PATH"

age -d -o enc-dot.tar enc-dot.tar.age

tar -xpf enc-dot.tar
rsync -avh "$NIX_PATH/enc-dot/" "$NIX_CONF/"

source "$NIX_INSTALL/config/all.sh"

show_summary