#!/bin/bash

brew tap homebrew/dupes

# replace Mac utils with GNU counterparts
brew install coreutils
brew install binutils
brew install diffutils
brew install findutils --with-default-names
brew install gawk
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew-install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls
brew install grep --with-default-names
brew install gzip
brew install watch
brew install wdiff
brew install wget

# git and related tools
brew install git
brew install git-flow

# shells
brew install zsh

# programming tools and binaries
brew install go
brew install nginx
brew install node
brew install postgresql
brew install python
brew install python3
brew install rbenv

# image and video libraries
brew install ffmpeg --with-theora --with-lib-vpx
brew install libjpeg
brew install webp

# etc
brew install heroku-toolbelt
brew install nmap
