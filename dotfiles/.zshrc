# ZSH OPTIONS
# ----------
# zsh options are laid out in the same order as they are listed
# in man zshoptions(1), using the same case and underscore format as listed.

# Changing Directories
setopt AUTO_CD  # cd into directories without using 'cd'

# Job Control
setopt NOTIFY  # report status of background jobs as soon as possible

# History
setopt APPEND_HISTORY  # multiple parallel zsh sessions share history

# Prompting
setopt PROMPT_SUBST  # allow expansion in the prompt

# Zsh Line Editor (ZLE)
unsetopt BEEP  # do not beep on error in ZLE


# ZSH MODULES
# -----------
autoload -U add-zsh-hook
autoload -Uz vcs_info
autoload -U zmv


# OH MY ZSH
# ---------
ZSH=$HOME/.oh-my-zsh
OHMYZSH=$ZSH/oh-my-zsh.sh
if [ -f $OHMYZSH ]; then
    plugins=(brew django heroku git mix-fast pip wd)
    source $OHMYZSH

    # prevent tmux windows from changing names
    # on process switch
    DISABLE_AUTO_TITLE=true
fi


# PROMPT
# ------
PROMPT_PATH_MAX_LENGTH=20
PROMPT_END='%(!.#.-)'
PROMPT_END_COLOR=$FG[105]
RPROMPT_COLOR=$FG[242]

if [[ -n $TMUX ]]; then
  HOSTNAME=""
else
  HOSTNAME="$(hostname):"
fi

PROMPT_COLOR=$FG[$($HOME/bin/hostname-color)]

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
${HOSTNAME}%$PROMPT_PATH_MAX_LENGTH<..<"'${vcs_info_msg_0_%%.}'"%<<\
%{$PROMPT_END%}%{$FX[reset]%} "

RPROMPT="%{$RPROMPT_COLOR%}"'${vcs_info_msg_1_}${VIRTUALENV_MARKER}'"%{$FX[reset]%}"


# EVERYTHING ELSE
# ---------------
bindkey -v  # allow for vim keybindings while editing command prompts

source $HOME/.commonrc
