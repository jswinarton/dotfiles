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

  # Disable default oh-my-zsh ls behaviour
  unalias ls
  unalias l
fi



# PROMPT
# ------
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

# EVERYTHING ELSE
# ---------------
cdpath+=(~/apps ~)

source $HOME/.commonrc
