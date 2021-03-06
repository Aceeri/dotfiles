#/bin/bash
set -e
DOTFILES=$HOME/dotfiles
source $DOTFILES/utils.sh

config_rm .vim
config_rm_ln .vimrc

if [[ $( cmd_exists pacman ) ]]; then
    pacman_install neovim vim
    pacman_install python2 python3

    echo "Installing vim plugins"
    vim +silent +PlugInstall +qall > /dev/null

    echo "Installing python2 neovim plugin"
    python2 -m pip install --user --upgrade pynvim
    echo "Installing python3 neovim plugin"
    python3 -m pip install --user --upgrade pynvim
fi
