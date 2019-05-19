#!/bin/sh
set -e
source ./utils.sh

# Initialize folders
echo "Making a Projects folder in $PROJECTS_DIR if it doesn't already exist"
mkdir -p "$PROJECTS_DIR"
echo "Making a Playground folder in $PLAYGROUND_DIR if it doesn't already exist"
mkdir -p "$PLAYGROUND_DIR"

echo "Removing existing config files/folders"

config_rm .xinitrc
config_rm .xprofile
config_rm .bashrc
config_rm .bash_profile

echo "Symlinking configs"
config_ln .xinitrc
config_ln .xprofile
config_ln .bashrc
config_ln .bash_profile

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
