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
plugins=(git brew cp django extract fabric git-flow mercurial lol npm osx pep8 pip python)

source $ZSH/oh-my-zsh.sh
source .profile

function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

project_aware_subl() {
    if [ -z $1 ]; then
        PROJECT_FOLDER=$(pwd)
    else
        PROJECT_FOLDER=$1
    fi

    if [ -e $PROJECT_FOLDER/*.sublime-project([1]) ]; then
        subl --project $PROJECT_FOLDER/*.sublime-project([1])
    else
        subl $PROJECT_FOLDER
    fi
}
alias subl="project_aware_subl"
