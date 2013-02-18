# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions

umask 0022

export EDITOR=vim
alias vi='vim'

#export PAGER=~/bin/vimpager
#alias less=$PAGER

alias ls='ls --color=tty'
alias la='ls -a'
alias ll='ls -alh'

if [ `uname` = "Darwin" ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
else
    source ~/.dotfiles/git-completion.bash
fi

PS1='[\u@\H \W$(__git_ps1 " (%s)")]\$ '

