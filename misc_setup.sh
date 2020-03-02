#/bin/bash
set -e
DOTFILES=$HOME/dotfiles
source $DOTFILES/utils.sh

if [[ $( cmd_exists pacman ) ]]; then
    pacman_install ripgrep
    pacman_install fzf
fi
