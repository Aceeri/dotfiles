#!/bin/sh
set -e
source ./utils.sh

config_rm .tmux
config_rm .tmuxrc

config_ln .tmuxrc

if [[ $( cmd_exists pacman ) ]]; then
    pacman_install tmux
    pacman_install git

    echo "Installing tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo "Starting server"
    tmux start-server

    echo "New session"
    tmux new-session -d

    #echo "Sourcing .tmux.conf"
    #tmux source ~/.tmux.conf

    echo "Install plugins with TPM"
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh

    echo "Kill server"
    tmux kill-server
fi
