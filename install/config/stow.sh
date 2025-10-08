#!/usr/bin/env bash

ds "Stowing files..."

# Stow configurations
# bash
stow -vSt ~/.config/bash -d $NIX_PATH/configs bash

# ani-cli
stow -vSt ~/.config/ani-cli -d $NIX_PATH/configs ani-cli

if cf "Stow rclone?"; then
    stow -vSt ~/.config/rclone -d $NIX_PATH/enc/ rclone
fi

# filebrowser
stow -vSt ~/.config/filebrowser -d $NIX_PATH/configs filebrowser

if cf "Stow .env?"; then
    stow -vSt ~/.config/env -d $NIX_PATH/enc/ env
fi

# tmux
stow -vSt ~/.config/tmux -d $NIX_PATH/configs tmux

# starship
stow -vSt ~/.config -d $NIX_PATH/configs starship

# eza
stow -vSt ~/.config/eza -d $NIX_PATH/configs eza