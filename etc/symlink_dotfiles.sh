#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$(cd $CURRENT_DIR && cd ../ && pwd)
BIN_DIR=$ROOT_DIR/bin
DOTFILE_DIR=$ROOT_DIR/dotfiles

shopt -s dotglob

for f in $DOTFILE_DIR/*
do
    DOTFILE_NAME="$(basename $f)"
    SRC_FILE=$DOTFILE_DIR/$DOTFILE_NAME
    DST_FILE=$HOME/$DOTFILE_NAME

    ln -sf $SRC_FILE $DST_FILE
done


for f in $BIN_DIR/*
do
    BIN_NAME="$(basename $f)"
    SRC_FILE=$BIN_DIR/$BIN_NAME
    DST_FILE=/usr/local/bin

    ln -sf $SRC_FILE $DST_FILE
done
