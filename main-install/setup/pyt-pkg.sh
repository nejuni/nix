#!/usr/bin/env bash

ds "Installing python packages..."

xargs pip install < $NIX_CONF/pkg/pyt-pkg.txt

tldr -u