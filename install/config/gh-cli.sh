#!/usr/bin/env bash

ds "Github Cli Setup..."

# Set up GitHub CLI
gh auth login --with-token < $NIX_PATH/enc/gh/gh.txt

gh auth setup-git

# Configure Git
git config --global user.name "nejuni"

git config --global user.email "dotdb00@gmail.com"

git config --global --add safe.directory /storage/emulated/0/01/git/nix
