ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nicoulaj"
CASE_SENSITIVE="true"
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt NO_BEEP
setopt EXTENDED_GLOB
setopt HIST_IGNORE_DUPS
plugins=(git brew cp django fabric git-flow mercurial lol npm osx pep8 pip python)
source $ZSH/oh-my-zsh.sh

export PATH="/opt/boxen/rbenv/shims:/opt/boxen/rbenv/bin:/opt/boxen/rbenv/plugins/ruby-build/bin:/opt/boxen/homebrew/share/python:/opt/boxen/nodenv/shims:/opt/boxen/nodenv/bin:bin:/opt/boxen/bin:/opt/boxen/homebrew/bin:/opt/boxen/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin"

source .aliases
export VIRTUALENV_DISTRIBUTE=true
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export EDITOR=/usr/bin/nano
export PYTHONSTARTUP=$HOME/.pythonrc

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
