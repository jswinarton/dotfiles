#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"

function do_it() {
    git pull origin master

    # copy files
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude ".extra" \
        --exclude "README" --exclude "LICENSE" -av --no-perms . ~

    # sync OS X settings
    ~/.osx

    # Sublime settings and binaries
    ln -Ffs ~/.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
    ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl > /dev/null 2>&1

    # update git configurations
    git config --global core.excludesfile '~/.gitignore_global'

    source ~/.profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    do_it
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        do_it
    fi
fi

unset do_it
