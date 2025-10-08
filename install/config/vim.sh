#!/usr/bin/env bash

ds "Setting up vim..."

mkdir -p ~/.vim

cp -r $NIX_PATH/configs/vim/* ~/.vim/

ds "Run vim manually to load plugins..."
