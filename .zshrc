set -o emacs
setopt emacs

# Emacs style keys
bindkey -e

no_powerline_prompt() {
    autoload -Uz vcs_info
    #zstyle ':vcs_info:*' enable git svn hg
    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' check-for-changes true
    #zstyle ':vcs_info:*' formats '%r on [%b] %c%u'
    zstyle ':vcs_info:*' formats ' [%F{red}%b%f]'

    autoload -U promptinit
    setopt prompt_subst
    promptinit

    precmd () { vcs_info }

    #${vcs_info_msg_0_}
    PROMPT='%F{yellow}%m%f:%F{magenta}%1~%f${vcs_info_msg_0_} %B%#%b '
}


if [ -f "$(which powerline-daemon)" ]; then
    . /usr/share/powerline/zsh/powerline.zsh
else
    no_powerline_prompt
fi

source $HOME/.aliases
source $HOME/.functions

# Global aliases
alias -g L='| less'
alias -g G='| grep'
alias -g GI='| grep -i'
alias -g X='| xargs'
alias -g C='| wc -l'
alias -g H='| head'
alias -g S='| sort'

# Suffix aliases
alias -s org='emacsclient -c'
alias -s html='firefox'
alias -s avi='totem'
alias -s mp4='totem'
alias -s ogg='totem'
alias -s mp3='totem'
