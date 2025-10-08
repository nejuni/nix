#!/usr/bin/env bash

ds "Config Setup..."

# Setting termux environment
run $NIX_INSTALL/config/termux-theme.sh

# Setting bash
run $NIX_INSTALL/config/bash.sh

if cf "Setup gh-cli?"; then
    run $NIX_INSTALL/config/gh-cli.sh
fi

if cf "Setup vim?"; then
    run $NIX_INSTALL/config/vim.sh
fi

if cf "Setup filebrowser?"; then
    run $NIX_INSTALL/config/filebrowser.sh
fi

# Stow files
run $NIX_INSTALL/config/stow.sh
