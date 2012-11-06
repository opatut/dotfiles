
# Check for an interactive session
[ -z "$PS1" ] && return

alias sc='sudo systemctl'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias :q='exit'
alias grep='grep --color=auto'
alias wifi='sudo netcfg -a; sudo netcfg'
alias svim='sudo vim'
alias suspend='sc suspend'
alias clip='xclip -selection clipboard'
alias ws='ssh -p 244 paul@councilofcode.org'
alias gls='git status'

if [[ $(which pacman-color 2> /dev/null) ]]; then
	alias pacman='pacman-color'
	alias spacman='sudo pacman-color'
else
	alias pacman='pacman'
	alias spacman='sudo pacman'
fi

# PS1='[\u@\h \W]\$ '
if [ -n "$SSH_CLIENT" ]; then 
    export PS1='\[\e[1;33m\][\u@\h \W]\$\[\e[0m\] '
else
    export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
fi

export PATH="/usr/lib/colorgcc/bin:"$HOME"/.android/sdk/platform-tools:"$PATH":"$HOME"/.bin/"
export ANDROID_HOME=$HOME"/.android/sdk/"

complete -cf sudo
export EDITOR=vim

if [[ -n "$DISPLAY" ]]; then
    BROWSER=chromium
fi

export LC_TIME="de_DE.UTF-8"

## SHARED HISTORY
#export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
#export HISTSIZE=10000
#export HISTFILESIZE=10000
#shopt -s histappend                      # append to history, don't overwrite it
## Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

eval `keychain --eval -Q -q ~/.ssh/id_rsa`

. /usr/share/bash-completion/completions/pacman
complete -F _pacman -o default spacman

. /usr/share/bash-completion/completions/netcfg
complete -F _netcfg -o default wifi

. /usr/share/bash-completion/completions/systemctl
complete -F _systemctl sc
