#!/bin/sh
set -e
source ./utils.sh

# Initialize folders
echo "Making a Projects folder in $PROJECTS_DIR if it doesn't already exist"
mkdir -p "$PROJECTS_DIR"
echo "Making a Playground folder in $PLAYGROUND_DIR if it doesn't already exist"
mkdir -p "$PLAYGROUND_DIR"

config_rm_ln .xbindkeysrc
config_rm_ln .xinitrc
config_rm_ln .xprofile
config_rm_ln .bashrc
config_rm_ln .bash_profile
config_rm_ln .i3blocks.conf

# Special case .config so it is just overwriting the configs in the repo instead of removing extras.
for filename in $DOTFILES/.config/*; do
	filename=$(basename $filename)
	echo "Overwriting $filename in ~/.config"
	config_rm .config/$filename
	config_ln .config/$filename
done

echo "Has pacman: $( cmd_exists pacman )"
echo "Has brew (TODO: support this): $( cmd_exists brew )"

echo "Setting up vim/neovim"
./vim_setup.sh

echo "Setting up tmux"
./tmux_setup.sh

echo "Misc. setup"
./misc_setup.sh
