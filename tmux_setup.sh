#!/bin/sh
set -e
source ./utils.sh

config_rm .tmux
config_rm .tmuxrc

config_ln .tmuxrc

if [[ $( cmd_exists pacman ) ]]; then
    pacman_install tmux
    pacman_install git

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ~/.tmux.conf

    tmux start-server
    tmux new-session -d
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    tmux kill-server
fi
