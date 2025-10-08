#!/usr/bin/env bash

ds "Post-install Setup..."

# Packages

# apt
run $NIX_INSTALL/setup/apt-pkg.sh

# python
run $NIX_INSTALL/setup/pyt-pkg.sh

# dir script
run $NIX_INSTALL/setup/dir.sh

# script load in ~/.local/bin
run $NIX_INSTALL/setup/script-setup.sh



