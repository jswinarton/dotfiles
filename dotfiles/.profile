# .profile
# This file is the main login shell configuration file that is shared by all shells.

# It is read automatically by /bin/sh and /bin/bash. All other shells (e.g. zsh) should
# source this file manually from their respective config files.

# # SHELL BASICS
# ----------

# set vim as the default editor if it's installed.
if command -v vim > /dev/null 2>&1; then
    export EDITOR=/usr/bin/vim
fi

# set vimpager as the default pager if it's installed.
if command -v vimpager > /dev/null 2>&1; then
    export PAGER=vimpager
fi

# add homebrew executables to the path
if [ -d "/usr/local/bin" ]; then
    export PATH=/usr/local/bin:$PATH
fi


# LANGUAGE-SPECIFIC SETTINGS
# ----------

# python
export PYTHONSTARTUP=$HOME/.pythonrc
export PYTHONDONTWRITEBYTECODE=1

# python: pip settings
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export PIP_REQUIRE_VIRTUALENV=true

syspip() {
    # create a shortcut to access the global pip installation,
    # since virtualenvs are required.
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# ruby
if command -v rbenv > /dev/null 2>&1; then
    eval "$(rbenv init -)"
    export PATH=$HOME/.rbenv/shims:$PATH
fi


# OTHER CONFIGURATION FILES
# ----------
source $HOME/.aliases

# $HOME/.extra contains extra scripts and aliases
# that aren't included as part of the public repository.
source $HOME/.extra 2> /dev/null


# TMUX
# ----------

# automatically start a new tmux session, called 'default'.
# TODO: make sure this doesn't happen on ssh'd shells, etc
[ -z $TMUX ] && tmux new -A -s default
