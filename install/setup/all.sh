#!/usr/bin/env bash

ds "Post-install Setup..."

# Packages

if cf "Install packages?"; then
    run $NIX_INSTALL/setup/apt-pkg.sh
    run $NIX_INSTALL/setup/pyt-pkg.sh
fi

# dir script
run $NIX_INSTALL/setup/dir.sh

# script load in ~/.local/bin
run $NIX_INSTALL/setup/script-setup.sh



