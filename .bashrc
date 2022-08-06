#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#############################
# Set environment variables #
#############################
# XDG Base Directory Specification (set according to xdg-ninja)
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export XCURSOR_PATH="/usr/share/icons:$XDG_DATA_HOME/icons"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Does not work with Lightdm
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# Set Neovim as default editor
export EDITOR="nvim"

##################
# Create aliases #
##################
# Better ls
alias ls="exa -al --header --color=always --group-directories-first --git --icons"
alias ll="exa -l --header --color=always --group-directories-first --git --icons"
alias lt="exa -aT --color=always --group-directories-first --icons"

# Dotfiles management with git
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Lazygit shortcut
alias lg="lazygit"

##############
# Set prompt #
##############
# The PS1 line is set so there is a fallback prompt in case starship is not installed
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
