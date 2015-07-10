source $HOME/.commonrc

CASE_SENSITIVE="true"
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt NO_BEEP
setopt EXTENDED_GLOB
setopt HIST_IGNORE_DUPS
setopt NONOMATCH

autoload -U zmv

# oh my zsh
ZSH=$HOME/.oh-my-zsh
OHMYZSH=$ZSH/oh-my-zsh.sh
if [ -f $OHMYZSH ]; then
    ZSH_THEME="nicoulaj"
    plugins=(git brew cp django extract fabric git-flow npm osx pep8 pip python dirhistory gem tmuxinator vagrant)

    source $OHMYZSH
fi

# zsh pip completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
