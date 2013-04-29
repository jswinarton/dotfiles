# Source the other dotfiles
source .aliases

# Boxen environment (yay)
source /opt/boxen/env.sh

########################
# virtualenv settings
# http://hackercodex.com/guide/python-virtualenv-on-mac-osx-mountain-lion-10.8/
########################

# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# pip packages can be installed globally with syspip
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# virtualenvwrapper
export WORKON_HOME=~/.envs
source /opt/boxen/homebrew/share/python/virtualenvwrapper.sh
