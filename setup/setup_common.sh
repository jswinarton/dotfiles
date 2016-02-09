#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(cd $CURRENT_DIR && cd ../ && pwd)
DOTFILE_DIR=$ROOT_DIR/dotfiles


###
# Symlink dotfiles
shopt -s dotglob

for f in $DOTFILE_DIR/*
do
    DOTFILE_NAME="$(basename $f)"
    SRC_FILE=$DOTFILE_DIR/$DOTFILE_NAME
    DST_FILE=$HOME/$DOTFILE_NAME

    ln -sf $SRC_FILE $DST_FILE
done


###
# Vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git $DOTFILE_DIR/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


###
# Shell upgrades
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
