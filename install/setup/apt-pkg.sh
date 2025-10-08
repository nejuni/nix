#!/usr/bin/env bash

ds "Setting choosen mirrors..."

ln -sf ${PREFIX}/etc/termux/mirrors/default ${PREFIX}/etc/termux/chosen_mirrors

ds "Installing apt packages..."

xargs pkg install -y < $NIX_PATH/configs/pkg/apt-pkg.txt