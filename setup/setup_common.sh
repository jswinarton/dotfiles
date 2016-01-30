#!/bin/bash

###
# Symlink dotfiles

shopt -s dotglob

DOTFILE_PATH_RELATIVE="../dotfiles"
DOTFILE_PATH="$(cd $DOTFILE_PATH_RELATIVE && pwd)";

for f in $DOTFILE_PATH/*
do
    DOTFILE_NAME="$(basename $f)"
    SRC_FILE=$DOTFILE_PATH/$DOTFILE_NAME
    DST_FILE=$HOME/$DOTFILE_NAME

    ln -sf $SRC_FILE $DST_FILE
done
