#!/usr/bin/env bash

ds "Stowing files..."

# Stow configurations

# Stow rclone?
stow -vSt ~/.config/rclone -d $NIX_CONF rclone


