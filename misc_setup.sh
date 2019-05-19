#/bin/sh
set -e
source ./utils.sh

if [[ $( cmd_exists pacman ) ]]; then
    pacman_install ripgrep
    pacman_install fzf
fi
