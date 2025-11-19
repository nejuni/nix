#!/usr/bin/env bash

ds "Stowing files..."

# Stow configurations
# bash
stow -vSt ~/.config/bash -d $NIX_CONF bash

# ani-cli
stow -vSt ~/.config/ani-cli -d $NIX_CONF ani-cli

# filebrowser
stow -vSt ~/.config/filebrowser -d $NIX_CONF filebrowser

# tmux
stow -vSt ~/.config/tmux -d $NIX_CONF tmux

# starship
stow -vSt ~/.config -d $NIX_CONF starship

# eza
stow -vSt ~/.config/eza -d $NIX_CONF eza