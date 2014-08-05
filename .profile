source .aliases
export EDITOR=/usr/bin/vim

export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export PYTHONSTARTUP=$HOME/.pythonrc
export PYTHONDONTWRITEBYTECODE=1
export VIRTUALENV_DISTRIBUTE=true
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export WORKON_HOME=$HOME/.envs
export PIP_VIRTUALENV_BASE=$WORKON_HOME

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

source /usr/local/bin/virtualenvwrapper.sh

syspip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Extra commands from other programs can be put into ~/.extra and
# it will be called at login.
source .extra 2> /dev/null
