#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lap --color=auto'
PS1='[\u@\h \W]\$ '
