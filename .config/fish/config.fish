### Environment Configuration ###
set -U fish_greeting  # Suppress fish's intro message
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" # Use bat as man pager

### Aliases ####
# Change ls to exa
alias ls='exa -al --header --color=always --group-directories-first --git --icons'
alias ll='exa -l --header --color=always --group-directories-first --git --icons'
alias lt='exa -aT --color=always --group-directories-first --icons'

# lazygit
alias lg="lazygit"

# dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias dotfiles-lg="lazygit -g=$HOME/dotfiles -w=$HOME"

### Programs to run ###
pfetch
