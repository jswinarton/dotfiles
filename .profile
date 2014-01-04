source .aliases
export VIRTUALENV_DISTRIBUTE=true
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export EDITOR=/usr/bin/vim
export PYTHONSTARTUP=$HOME/.pythonrc
export PYTHONDONTWRITEBYTECODE=1

syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

append_idem(){
    # Adds a line to a file if it isn't already there
    # eg. append_idem .profile "source .hgrc"
    grep -qx "$2" "$1" || echo "$2" >> $1
}

# Extra commands from other programs can be put into ~/.extra and
# it will be called at login.
source .extra 2> /dev/null
