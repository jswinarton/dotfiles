export EDITOR=/usr/bin/vim
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PYTHONSTARTUP=$HOME/.pythonrc
export PYTHONDONTWRITEBYTECODE=1
export VIRTUALENV_DISTRIBUTE=true

syspip(){
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

source .aliases
source .extra 2> /dev/null
