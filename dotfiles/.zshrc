# ZSH OPTIONS
# ----------
# zsh options are laid out in the same order as they are listed
# in man zshoptions(1), using the same case and underscore format as listed.

# Changing Directories
setopt AUTO_CD  # cd into directories without using 'cd'

# Expansion and Globbing
setopt EXTENDED_GLOB

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
PROMPT_COLOR=$FG[003]
RPROMPT_COLOR=$FG[242]

add-zsh-hook precmd vcs_info

# vcs_info parameters
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '○'
zstyle ':vcs_info:*:*' stagedstr '●'
zstyle ':vcs_info:*:*' formats "%B%r%%b%F{3}/%15<..<%S%<<" "%u%c  %b"
zstyle ':vcs_info:*:*' actionformats "%B%r%%b%F{3}/%15<..<%S%<<" "%u%c  %b"
zstyle ':vcs_info:*:*' nvcsformats "%20<..<%~%<<" " "


PROMPT='%F{3}▲ ${vcs_info_msg_0_}%f '
RPROMPT='%F{243}${vcs_info_msg_1_}%f'


# EVERYTHING ELSE
# ---------------
cdpath+=(~/apps ~)

source $HOME/.commonrc
