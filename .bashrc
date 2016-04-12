# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"


# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history"

# Useful timestamp format
HISTTIMEFORMAT='%F %T '

shopt -s autocd
shopt -s dirspell
shopt -s cdspell


CDPATH="." #CDPATH=".:~/repos"


# Prompt
GREEN="\[$(tput setaf 2)\]"
CYAN="\[$(tput setaf 6)\]"
BOLD="\[$(tput bold)\]"
LGREEN="\[$(tput setaf 10)\]"
YELLOW="\[$(tput setaf 11)\]"
RESET="\[$(tput sgr0)\]"

powerline_enabled=0
if test $powerline_enabled -eq 0 && [ "$TERM" != "dumb" ] &&  [ -f "$(which powerline-daemon)" ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bash/powerline.sh
else
    export PS1="${CYAN}\u${RESET} ${BOLD}@${RESET} ${YELLOW}\h${RESET} in ${GREEN}\W${RESET} \n[\$?]${BOLD}\$${RESET} "
fi

source $HOME/.aliases
source $HOME/.functions

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
