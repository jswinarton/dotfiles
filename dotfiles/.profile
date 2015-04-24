export EDITOR=/usr/bin/vim
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# ruby settings
eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/shims:$PATH

# python settings
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PYTHONSTARTUP=$HOME/.pythonrc
export PYTHONDONTWRITEBYTECODE=1
export VIRTUALENV_DISTRIBUTE=true

syspip(){
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

source $HOME/.aliases

# use .extra to add extra scripts/aliases that
# you don't want to keep as part of your
# public dotfiles repo.
source $HOME/.extra 2> /dev/null

[ -z $TMUX ] && tmux new -A -s default
