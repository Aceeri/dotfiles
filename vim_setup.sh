#/bin/sh
set -e
source ./utils.sh

config_rm .vim
config_rm .vimrc

config_ln .vimrc

if [[ $( cmd_exists pacman ) ]]; then
    pacman_install neovim vim
    pacman_install python2 python3

    echo "Installing vim plugins"
    vim +silent +PlugInstall +qall
    python2 -m pip install --user --upgrade pynvim
    python3 -m pip install --user --upgrade pynvim
fi
