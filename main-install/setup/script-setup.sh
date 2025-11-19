#!/usr/bin/env bash

ds "Setting up scripts..."

cp -r $NIX_CONF/bin/* ~/.local/bin/

chmod -R 700 ~/.local/bin/*
