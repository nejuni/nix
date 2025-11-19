#!/usr/bin/env bash

ds "Github Cli Setup..."

# Set up GitHub CLI
gh auth login --with-token < $NIX_CONF/gh/gh.txt

gh auth setup-git

# Configure Git
git config --global user.name "nejuni"

git config --global user.email "dotdb00@gmail.com"
