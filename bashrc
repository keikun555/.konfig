# Some environment variables
export KONFIG_DIR='~/.konfig'
export EDITOR='vim'
export TERM='xterm-256color-italic'

# start the ssh-agent if not running and add my keys
SSH_ENV="$HOME/.ssh/environment"
 
function start_agent {
        echo "Initialising new SSH agent..."
        /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
        echo succeeded
        chmod 600 "${SSH_ENV}"
        . "${SSH_ENV}" > /dev/null
        /usr/bin/ssh-add;
}
 
if [ -f "${SSH_ENV}" ]
then
        . "${SSH_ENV}" > /dev/null
        #ps ${SSH_AGENT_PID} doesn't work under cywgin
        ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
                start_agent;
        }
else
        start_agent;
fi

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

# Kei's aliases/commands
function cht {
  curl cht.sh/$1
}

# User specific aliases and functions
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

alias cd..='cd ..'
alias cp='cp -i'
alias c='clear'
alias d='ls'
alias df='df -h -x supermount -x"squashfs" -h'
alias du='du -h'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias grep='grep --color'
alias l='ls'
alias la='ls -a'
alias latr='ls -latrh'
alias latr1='ls -latrh1'
alias ll='ls -lh'
alias ls='ls -F --color=auto'
alias lsd='ls -d */'
alias md='mkdir'
alias mv='mv -i'
alias p='cd -'
alias rd='rmdir'
alias rm='rm -i'
alias tl='tmux ls'
alias ta='tmux attach'
alias tat='tmux attach -t '
