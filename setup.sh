#!/bin/sh

DOTFILES=$HOME/dotfiles
if [ ! -d "$DOTFILES" ]; then
	echo "Missing dotfiles directory. Try git cloning"
	exit
fi

PROJECTS_DIR=$HOME/projects
PLAYGROUND_DIR=$HOME/play

# Initialize folders
echo "Making a Projects folder in $PROJECTS_DIR if it doesn't already exist"
mkdir -p "$PROJECTS_DIR"
echo "Making a Playground folder in $PLAYGROUND_DIR if it doesn't already exist"
mkdir -p "$PLAYGROUND_DIR"

echo "Removing existing config files/folders"

config_rm () {
	echo "Removing ~/$1";
	sudo rm -rf ~/$1 > /dev/null 2>&1
}

config_rm .vimrc
config_rm .xinit
config_rm .xprofile
config_rm .bashrc
config_rm .bash_profile
config_rm .tmux.conf

echo "Symlinking configs"

config_ln () {
	echo "Symlinking $DOTFILES/$1 -> ~/$1";
	ln -sf $DOTFILES/$1 ~/$1
}

config_ln .vimrc
config_ln .xinit
config_ln .xprofile
config_ln .bashrc
config_ln .bash_profile
config_ln .tmux.conf

# Special case .config so it is just overwriting the configs in the repo instead of removing extras.
for filename in $DOTFILES/.config/*; do
	filename=$(basename $filename)
	echo "Overwriting $filename in ~/.config"
	config_rm .config/$filename
	config_ln .config/$filename
done
