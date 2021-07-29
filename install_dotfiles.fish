
# Clone bare repository to $HOME/dotfiles
git clone --bare https://github.com/mestru17/dotfiles $HOME/dotfiles

# Create dotfiles command in current context
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# Pull dotfiles
dotfiles checkout

# Don't show untracked files when running dotfiles commands
dotfiles config --local status.showUntrackedFiles no
