# source .aliases
# source .bash_prompt

export VIRTUALENV_DISTRIBUTE=true
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export WORKON_HOME=~/.envs

syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

append_idem(){
    # Adds a line to a file if it isn't already there
    # eg. append_idem .profile "source .hgrc"
    ! grep -qx "$2" "$1" && echo "$2" >> $1
}

# source /opt/boxen/env.sh
# source /opt/boxen/homebrew/share/python/virtualenvwrapper.sh
