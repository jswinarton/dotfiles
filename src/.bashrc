#
# ~/.bashrc
#

source $HOME/.commonrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
