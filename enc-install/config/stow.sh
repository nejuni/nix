#!/usr/bin/env bash

ds "Stowing files..."

# Stow configurations

# Stow rclone
stow -vSt ~/.config/rclone -d $NIX_CONF rclone

# isyncrc
stow -vSt ~/.config -d $NIX_CONF isyncrc

# notmuch
stow -vSt ~/ -d $NIX_CONF notmuch

