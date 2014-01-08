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
setopt NONOMATCH
autoload -U zmv
plugins=(git brew cp django fabric git-flow mercurial lol npm osx pep8 pip python)
source $ZSH/oh-my-zsh.sh

export PATH="/opt/boxen/rbenv/shims:/opt/boxen/rbenv/bin:/opt/boxen/rbenv/plugins/ruby-build/bin:/opt/boxen/homebrew/share/python:/opt/boxen/nodenv/shims:/opt/boxen/nodenv/bin:bin:/opt/boxen/bin:/opt/boxen/homebrew/bin:/opt/boxen/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin"

source .profile

project_aware_subl() {
    if [ -z $1 ]; then
        PROJECT_FOLDER=$(pwd)
    else
        PROJECT_FOLDER=$1
    fi

    PROJECT_FILE="$PROJECT_FOLDER/*.sublime-project([1])"
    if [ -e $PROJECT_FOLDER/*.sublime-project ]; then
        subl --project $PROJECT_FILE
    else
        subl $PROJECT_FOLDER
    fi
}
alias subl="project_aware_subl"
