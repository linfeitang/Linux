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
alias lla='ls -al'
alias down='shutdown -h now'
alias srn='shutdown -r now'
alias ni='sudo apt-get install --no-install-recommends'
alias se='apt-cache search'
alias re='sudo apt-get remove'
alias purge='sudo apt-get --purge remove'
alias ud='sudo apt-get update'
alias ug='sudo apt-get upgrade'
alias search='apt-cache search'
alias auto='sudo apt-get autoremove'
alias cde='cd /media/liner/E'
alias cdg='cd /media/liner/G'
alias cdk='cd /media/liner/K'

#PS1='\[\e[1;36m\]\w
#\[\e[1;37m\] \[\e[1;37m\]'
#PS1='\[\e[1;31m\]\h\[\e[1;34m\]@\u:\[\e[1;32m\]\w\[\e[0;36m\]>>> \[\e[0;37m\]'
PS1='\[\e[0;31m\]\w > \[\e[0;30m\]'
