#!/usr/bin/env bash

ds "Config Setup..."

# Setting termux environment
run $NIX_INSTALL/config/termux-theme.sh

# Setting bash
run $NIX_INSTALL/config/bash.sh

# gh-cli setup
run $NIX_INSTALL/config/gh-cli.sh

# vim
run $NIX_INSTALL/config/vim.sh

# file browser
run $NIX_INSTALL/config/filebrowser.sh

# Stow files
run $NIX_INSTALL/config/stow.sh
