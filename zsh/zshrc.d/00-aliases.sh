#!/bin/bash

unset GREP_OPTIONS

function e() {
    nvr $(echo $@ | sed 's/[[:graph:]]*/--remote \0/g')
    # gvim --servername vim --remote $@
}

function E() {
    e $@
    # gvim --role floating -geometry 100x24 $@
    # -c 'startinsert'
}

alias bootlog='sudo journalctl -b'
alias clip='xclip -selection clipboard'
alias clocksync='sudo ntpd -qg && sudo hwclock --systohc'
alias csv='tabview -w max'
alias date1='date +"%Y%m%d%H%M%S"'
alias date2='date +"%Y-%m-%d-%H-%M-%S"'
alias date3='date +"%Y%m%d-%H%M%S"'
alias date4='date +"%Y-%m-%d %H:%M:%S"'
alias gls='git status'
alias grep='grep --color=auto'
alias jsonformat='python -m json.tool | pygmentize -l json -f terminal256'
alias la='ls -lvha'
alias less='less -S'
alias ll='ls -lvh'
alias ls='ls --group-directories-first -v --color=auto'
alias mdless='pandoc -s -f markdown -t man !* | groff -T utf8 -man | less'
alias mysql='mysql --auto-rehash'
alias nis='npm install --save'
alias ntfs-mount='sudo mount -t ntfs -o rw,auto,uid=$UID,gid=$GID,fmask=0133,dmask=0022'
alias nyan='cat'
alias paste='xclip -selection clipboard -o'
alias pastie='wgetpaste -C'
alias pdf='evince'
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias share='droopy --dl -m "Let'"'"'s share!"'
alias spacman='sudo pacman'
alias suspend='echo "Just press the fucking button."'
alias svim='sudo vim'
alias syslog='sudo journalctl -f -n30'
alias tree='tree -C'
alias w='wish'
alias wgetpaste='wgetpaste -C'
alias yaourt='PKGEXT=.tar yaourt'

export TERM=xterm-256color
export PATH="/usr/local/bin:/usr/lib/colorgcc/bin:$HOME/.android/sdk/platform-tools:$HOME/.android/sdk/tools:$HOME/.gem/ruby/2.1.0/bin:$HOME/.bin/:$(ruby -e 'puts Gem.user_dir')/bin:.:$HOME/.npm-global/bin/:$PATH"
export EDITOR=nvim
export WINE_DEBUG=-all
export BROWSER=chromium
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
export NODE_REPL_HISTORY_FILE="$HOME/.nodehistory"
export NODE_PATH="$HOME/.npm-global/lib/node_modules"
export ANDROID_HOME=/opt/android-sdk
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
