#!/usr/bin/env bash

ds "Setting up scripts..."

cp -r $NIX_PATH/configs/bin/* ~/.local/bin/

chmod -R 700 ~/.local/bin/*
