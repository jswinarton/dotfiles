export TERM=xterm-256color

tput sgr0
MAGENTA=$(tput setaf 9)
ORANGE=$(tput setaf 172)
YELLOW=$(tput setaf 184)
GREEN=$(tput setaf 70)
BLUE=$(tput setaf 26)
PURPLE=$(tput setaf 171)
WHITE=$(tput setaf 255)
GRAY=$(tput setaf 241)
RESET=$(tput sgr0)

parse_hg_dirty() {
  [[ $(hg st 2> /dev/null) != '' ]] && echo '*'
}

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1='\[$BLUE\]\w\[$GRAY\]$ \[$RESET\]'