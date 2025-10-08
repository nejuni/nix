#!/usr/bin/env bash

ds "Installing python packages..."

xargs pip install < $NIX_PATH/configs/pkg/pyt-pkg.txt

tldr -u