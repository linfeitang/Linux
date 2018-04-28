#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ne='neofetch'
alias st='startx'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias down='shutdown -h now'
alias srn='shutdown -r now'

alias ni='sudo apt-get install --no-install-recommends'
alias search='apt-cache search'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get --purge remove'
#移除软件包的同时删除其配置文件
alias ud='sudo apt-get update'
alias ug='sudo apt-get upgrade'

#PS1='\[\e[1;36m\]\w
#\[\e[1;37m\] \[\e[1;37m\]'
PS1='\[\e[1;31m\]\h\[\e[1;34m\]@\u:\[\e[1;32m\]\w\[\e[1;33m\]>>> \[\e[0;37m\]'
