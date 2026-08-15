#!/usr/bin/env bash

ds "Stowing files..."

# Stow configurations

# bash
stow -vSt ~/.config/bash -d $NIX_CONF bash

# tmux
stow -vSt ~/.config/tmux -d $NIX_CONF tmux

# starship
stow -vSt ~/.config -d $NIX_CONF starship

# eza
stow -vSt ~/.config/eza -d $NIX_CONF eza

# yazi
stow -vSt ~/.config/yazi -d $NIX_CONF yazi
