#!/usr/bin/env bash

# Main script
# Define nix locations used a variable
export NIX_PATH="$HOME/.local/share/nix"
export NIX_INSTALL="$NIX_PATH/install"

# Source function
source "$NIX_INSTALL/fu.sh"

# Install
source "$NIX_INSTALL/setup/all.sh"
source "$NIX_INSTALL/config/all.sh"

# Check your summary by function
show_summary
