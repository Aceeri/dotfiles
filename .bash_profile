# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH=$PATH:/usr/local/go/bin
export PATH

export GOPATH=~/gt/go
export GOBIN=/usr/bin/local
