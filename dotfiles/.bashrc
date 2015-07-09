# SHELL BASICS
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

# automatically start a new tmux session, called 'default',
# or attach the default session if it already exists.
# This command will not run if we are already running tmux
# (i.e. the $TMUX var is already set).
if command -v tmux > /dev/null 2>&1 && [ -z $TMUX ]; then
    tmux new -A -s default
fi
