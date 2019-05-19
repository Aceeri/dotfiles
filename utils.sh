#/bin/sh

DOTFILES=$HOME/dotfiles
if [ ! -d "$DOTFILES" ]; then
	echo "Missing dotfiles directory. Try git cloning"
	exit
fi

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

cmd_exists() {
    if [[ $( type $1 > /dev/null ) ]]; then
        echo 1
    else
        echo 0
    fi
}

pacman_install() {
    echo "Installing $@"
    for package in "$@"
    do
        sudo pacman -S --needed --noconfirm $package > /dev/null
    done
}
