#!/usr/bin/env bash

ds "Setting up vim..."

mkdir -p ~/.vim

cp -r $NIX_CONF/vim/* ~/.vim/

ds "Run vim manually to load plugins..."
