# Some environment variables
export EDITOR='vim'

# set prompt
PS1="[\d \t] \u@\h\n\w\$ "

# For LaTeX
export PATH=${PATH}:/usr/local/texlive/2016/bin/x86_64-linux

# For CUDA
export PATH=/usr/local/cuda-8.0/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:${LD_LIBRARY_PATH}

# kbin and sbin
export PATH=$HOME/kbin:/usr/local/sbin:/usr/sbin:/sbin${PATH}

# ibus-anthy
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

alias cd..='cd ..'
alias cp='cp -i'
alias c='clear'
alias d='ls'
alias df='df -h -x supermount'
alias du='du -h'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias grep='grep --color'
alias l='ls'
alias la='ls -a'
alias latr='ls -latr'
alias ll='ls -l'
alias ls='ls -F --color=auto'
alias lsd='ls -d */'
alias md='mkdir'
alias mv='mv -i'
alias p='cd -'
alias rd='rmdir'
alias rm='rm -i'
