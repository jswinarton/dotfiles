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
    plugins=(django git)
    source $OHMYZSH
fi

# PROMPT
# ----------
# inspired by https://github.com/BinaryMuse/oh-my-zsh/blob/master/themes/nicoulaj.zsh-theme

PROMPT_PATH_MAX_LENGTH=20
PROMPT_END='%(!.#.-)'
PROMPT_COLOR=$FG[121]
PROMPT_END_COLOR=$FG[105]
RPROMPT_COLOR=$FG[242]

# add a marker if we're in a python virtualenv
function set_virtualenv_marker() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        VIRTUALENV_MARKER=" •"
    else
        VIRTUALENV_MARKER=""
    fi
}

add-zsh-hook precmd set_virtualenv_marker
add-zsh-hook precmd vcs_info

# vcs_info parameters
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '*'
zstyle ':vcs_info:*:*' stagedstr '&'
zstyle ':vcs_info:*:*' formats "%S" "%u%c %r:%b"
zstyle ':vcs_info:*:*' actionformats "%S" "(%a) %u%c %r:%b"
zstyle ':vcs_info:*:*' nvcsformats "%~" " "


PROMPT="%{$PROMPT_COLOR%}\
%$PROMPT_PATH_MAX_LENGTH<..<"'${vcs_info_msg_0_%%.}'"%<<\
%{$PROMPT_END%}%{$FX[reset]%} "

RPROMPT="%{$RPROMPT_COLOR%}"'${vcs_info_msg_1_}${VIRTUALENV_MARKER}'"%{$FX[reset]%}"

# EVERYTHING ELSE
# ----------
source $HOME/.commonrc
