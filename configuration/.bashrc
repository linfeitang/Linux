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
alias nn='sudo pacman -Syu'
alias ni='sudo pacman -S'
alias down='shutdown -h now'
alias re='shutdown -r now'

alias search='apt-cache search'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get --purge remove'
#移除软件包的同时删除其配置文件
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'

alias 1='xbacklight -1'
alias 2='xbacklight -2'
alias 3='xbacklight -3'
alias 4='xbacklight -4'
alias 5='xbacklight -5'

alias 11='xbacklight +1'
alias 22='xbacklight +2'
alias 33='xbacklight +3'
alias 44='xbacklight +4'
alias 55='xbacklight +5'

#PS1='\[\e[1;36m\]\w
#\[\e[1;37m\] \[\e[1;37m\]'
PS1='\[\e[0;31m\]\h\[\e[0;34m\]@\u:\[\e[0;32m\]\w\[\e[0;30m\]>>> \[\e[0;30m\]'
