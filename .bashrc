#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINAL="termite"

alias ls='ls -lap --color=auto'
PS1='[\u@\h \W]\$ '

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_DIR=/usr/share/fzf/
[ -f $FZF_DIR/key-bindings.bash ] && source $FZF_DIR/key-bindings.bash
[ -f $FZF_DIR/completion.bash ] && source $FZF_DIR/completion.bash
