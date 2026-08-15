#!/usr/bin/env bash

ds "Config Setup..."

# Setup gh-cli?
run $NIX_INSTALL/config/gh-cli.sh

# Stow files
run $NIX_INSTALL/config/stow.sh
