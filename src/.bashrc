#
# ~/.bashrc
#

source $HOME/.commonrc

# fzf completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
