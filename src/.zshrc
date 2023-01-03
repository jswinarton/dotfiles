source $HOME/.commonrc

# Start of lines added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format '-> %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' group-order \
  local-directories path-directories aliases commands builtins
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/home/jeremy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history extended_history inc_append_history autocd hist_ignore_all_dups hist_find_no_dups
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Manually configured options
setopt extendedglob promptsubst

bindkey '^R' history-incremental-search-backward  # enable reverse history search for vim-style bindings
bindkey '^[[Z' reverse-menu-complete  # allow reverse tabbing on completion

autoload -U add-zsh-hook
autoload -Uz vcs_info
autoload -U zmv

cdpath=(~ ~/apps/ ~/apps/_*(N))

# Prompt
#

PROMPT='%F{11}${vcs_info_msg_0_}%f '
RPROMPT='%F{7}${vcs_info_msg_1_}%f'

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '○'
zstyle ':vcs_info:*:*' stagedstr '●'
zstyle ':vcs_info:*:*' nvcsformats " %(6~|%-2~/../%2~|%~)" "%m"

function set_vcs_info_formats() {
  GIT_BASE_LEFT_INFO_FORMAT=" %B%r%%b%F{3}"
  GIT_SUBDIR_FORMAT="/%20<..<%S%<<"
  GIT_RIGHT_INFO_FORMAT="%a %u%c %b"

  # Only show subdir prompt if not in root git dir
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

# Etc
#

# fzf
FZF_KEYBINDINGS=/usr/share/doc/fzf/examples/key-bindings.zsh
[ -f $FZF_KEYBINDINGS ] && source $FZF_KEYBINDINGS

FZF_COMPLETION=/usr/share/doc/fzf/examples/completion.zsh
[ -f $FZF_COMPLETION ] && source $FZF_COMPLETION


source $HOME/.zshrc.private 2> /dev/null  # hook for private configuration
