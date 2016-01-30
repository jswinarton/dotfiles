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

    ln -s $SRC_FILE $DST_FILE
done


###
# Vim plugins

git clone https://github.com/VundleVim/Vundle.vim.git $DOTFILE_DIR/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


###
# Shell upgrades
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh


###
# Python
sudo pip install flake8==2.4.1
sudo pip install requests==2.6.0
sudo pip install virtualenv==13.1.0


###
# Ruby
sudo gem install pry
sudo gem install rails
