#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ne='screenfetch'
alias st='startx'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias nn='sudo pacman -Syu'
#PS1='\[\e[1;36m\]\w
#\[\e[1;37m\] \[\e[1;37m\]'
PS1='\[\e[1;31m\]\h\[\e[1;34m\]@\u:\[\e[0;32m\]\w\[\e[1;33m\]>>> \[\e[1;37m\]'
