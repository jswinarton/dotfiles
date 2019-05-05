# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/jeremy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Manually configured options

setopt extendedglob promptsubst

autoload -U add-zsh-hook
autoload -Uz vcs_info
autoload -U zmv

cdpath+=(~/apps ~)

PROMPT='%F{11}▲ ${vcs_info_msg_0_}%f '
RPROMPT='%F{7}${vcs_info_msg_1_}%f'

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '○'
zstyle ':vcs_info:*:*' stagedstr '●'
zstyle ':vcs_info:*:*' nvcsformats "%20<..<%~%<<" " "

function set_vcs_info_formats() {
  GIT_BASE_LEFT_INFO_FORMAT="%B%r%%b%F{3}"
  GIT_SUBDIR_FORMAT="/%20<..<%S%<<"
  GIT_RIGHT_INFO_FORMAT="%u%c  %b"

  if [ -d .git ]; then
    GIT_LEFT_INFO_FORMAT=$GIT_BASE_LEFT_INFO_FORMAT
  else
    GIT_LEFT_INFO_FORMAT="${GIT_BASE_LEFT_INFO_FORMAT}${GIT_SUBDIR_FORMAT}"
  fi

  zstyle ':vcs_info:*:*' formats $GIT_LEFT_INFO_FORMAT $GIT_RIGHT_INFO_FORMAT
  zstyle ':vcs_info:*:*' actionformats $GIT_LEFT_INFO_FORMAT $GIT_RIGHT_INFO_FORMAT

  vcs_info
}

add-zsh-hook precmd set_vcs_info_formats

source $HOME/.commonrc