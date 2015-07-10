# AUTOCOMPLETION PARAMETERS
# ----------
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/Users/jeremy/.zshrc'
autoload -Uz compinit
compinit


# HISTORY
# ----------
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000


# ZSH OPTIONS
# ----------
setopt appendhistory
setopt autocd
setopt extendedglob
setopt nomatch
setopt notify
setopt promptsubst

unsetopt beep

# ZSH MODULES
# ----------
autoload -U add-zsh-hook
autoload -Uz vcs_info
autoload -U zmv

# OH MY ZSH
# ----------
ZSH=$HOME/.oh-my-zsh
OHMYZSH=$ZSH/oh-my-zsh.sh
if [ -f $OHMYZSH ]; then
    source $OHMYZSH
fi

# PROMPT
# ----------
# inspired by https://github.com/BinaryMuse/oh-my-zsh/blob/master/themes/nicoulaj.zsh-theme

PROMPT_PATH_MAX_LENGTH=20
PROMPT_END='>'
PROMPT_COLOR=$FG[242]

# Add hook for calling vcs_info before each command
add-zsh-hook precmd vcs_info

# vcs_info parameters
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '*'
zstyle ':vcs_info:*:*' stagedstr '&'
zstyle ':vcs_info:*:*' formats "%S" "%r:%b %u%c"
zstyle ':vcs_info:*:*' actionformats "%S" "%r:%b %u%c (%a)"
zstyle ':vcs_info:*:*' nvcsformats "%~" ""


PROMPT="%{$PROMPT_COLOR%}%$PROMPT_PATH_MAX_LENGTH<..<"'${vcs_info_msg_0_%%.}'"%<<%{$PROMPT_END%}%{$FX[reset]%} "
RPROMPT="%{$PROMPT_COLOR%}"'$vcs_info_msg_1_'"%{$FX[reset]%}"

source $HOME/.commonrc
