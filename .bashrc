#!/usr/bin/env bash

# Put everything in a function so local variables can be used, thereby
# preventing variables from persisting in the shell after sourcing
# this file.
main() {
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

	# Use bat instead of less when viewing man pages
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"

	# Add doom emacs binaries to PATH
	export PATH="$HOME/.emacs.d/bin:$PATH"

	##################
	# Create aliases #
	##################
	# Better ls
	alias ls="exa -al --header --color=always --group-directories-first --git --icons"
	alias ll="exa -l --header --color=always --group-directories-first --git --icons"
	alias lt="exa -aT --color=always --group-directories-first --icons"

	# Lazygit shortcut
	alias lg="lazygit"

	# Dotfiles management with git
	local config_git_dir="$HOME/.dotfiles"
	local config_work_tree="$HOME"

	# shellcheck disable=SC2139
	alias config="/usr/bin/git --git-dir=$config_git_dir --work-tree=$config_work_tree"

	# shellcheck disable=SC2139
	alias config-lg="lazygit -g=$config_git_dir -w=$config_work_tree"

	# Connect to emacs daemon instead of normal start
	alias emacs="emacsclient -c"

	######################
	# Source other files #
	######################
	# Add rust/cargo/rustup to path
	local cargo_env_file="$HOME/.cargo/env"
	if [ -f "$cargo_env_file" ]; then
		# shellcheck disable=SC1090
		source "$cargo_env_file"
	fi

	##############
	# Set prompt #
	##############
	# The PS1 line is set so there is a fallback prompt in case starship is not installed
	PS1='[\u@\h \W]\$ '
	eval "$(starship init bash)"

	###########
	# Cleanup #
	###########
	# Un-declare main so it doesn't persist in the shell after sourcing.
	unset -f main
}

main "$@"
