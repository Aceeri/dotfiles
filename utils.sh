#/bin/bash

DOTFILES=$HOME/dotfiles
PROJECTS_DIR=$HOME/projects
PLAYGROUND_DIR=$HOME/play

config_rm () {
	echo "Removing ~/$1";
	sudo rm -rf ~/$1 > /dev/null 2>&1
}

config_ln () {
	echo "Symlinking $DOTFILES/$1 -> ~/$1";
	ln -sf $DOTFILES/$1 ~/$1
}

config_rm_ln () {
    config_rm $1
    config_ln $1
}

cmd_exists() {
    #if [[ $( type $1 2>&1 > /dev/null ) ]]; then
    if [[ $( command -v $1 ) ]]; then
        echo "exists";
    else
        >&2 echo "does not exist: $1";
    fi
}

pacman_install() {
    echo "Installing $@"
    for package in "$@"
    do
        sudo pacman -S --needed --noconfirm $package > /dev/null
    done
}
