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

# shells and editors
brew install tmux
brew install vim --override-system-vi
brew install vimpager
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
brew install ag
brew install ctags
brew install heroku-toolbelt
brew install nmap
brew install reattach-to-user-namespace

# cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install atom
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install hammerspoon
brew cask install iterm2
brew cask install rdio
brew cask install slack
brew cask install transmission
brew cask install virtualbox43691406  # old version that supports vagrant
brew cask install vlc

