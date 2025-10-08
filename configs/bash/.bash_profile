#!/data/data/com.termux/files/usr/bin/bash

#load bashrc
[[ -f ~/.config/bash/ba.rc ]] && . ~/.config/bash/ba.rc

# EXPORTS & ENVIRONMENT VARIABLES

# History settings
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTCONTROL=erasedups:ignoredups:ignorespace
shopt -s histappend
PROMPT_COMMAND='history -a'

# Default editors
export EDITOR=vim
export VISUAL=vim

# exporting script path
export PATH="$HOME/.local/bin:$PATH"

# Initialize tools if installed
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd bash)"
fi
