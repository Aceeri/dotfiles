#!/bin/sh
set -e
source ./utils.sh

if tmux info > /dev/null; then
    echo "Must not be in tmux and tmux server must be killed (\`tmux kill-server\`)"
    exit
fi

config_rm .tmux
config_rm_ln .tmuxrc

if [[ $( cmd_exists pacman ) ]]; then
    pacman_install tmux
    pacman_install git

    echo "Installing tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo "Starting server"
    tmux start-server

    echo "New session"
    tmux new-session -d

    tmux source ~/.tmux.conf

    echo "Install plugins with TPM"
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh

    echo "Killing server"
    tmux kill-server
fi
