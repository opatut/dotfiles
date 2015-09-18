#!/bin/bash

alias spacman='sudo pacman'
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias ls='ls --group-directories-first -v --color=auto'
alias ll='ls -lvh'
alias la='ls -lvha'
alias svim='sudo vim'
alias suspend='echo "Just press the fucking button."'
alias gls='git status'
alias tree='tree -C'
alias pdf='evince'
alias nyan='cat'
alias wgetpaste='wgetpaste -C'
alias pastie='wgetpaste -C'
alias bootlog='sudo journalctl -b'
alias syslog='sudo journalctl -f -n30'
alias ntfs-mount='sudo mount -t ntfs -o rw,auto,uid=$UID,gid=$GID,fmask=0133,dmask=0022'
alias share='droopy --dl -m "Let'"'"'s share!"'
alias mdless='pandoc -s -f markdown -t man !* | groff -T utf8 -man | less'
alias clip='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias jsonformat='python -m json.tool | pygmentize -l json -f terminal256'
alias clocksync='sudo ntpd -qg && sudo hwclock --systohc'
alias yaourt='PKGEXT=.tar yaourt'
alias less='less -S'
unset GREP_OPTIONS
alias grep='grep --color=auto'
alias csv='tabview -w max'

export PATH="/usr/lib/colorgcc/bin:"$HOME"/.android/sdk/platform-tools:"$HOME"/.android/sdk/tools:"$PATH":"$HOME"/.gem/ruby/2.1.0/bin:"$HOME"/.bin/:"$(ruby -e 'puts Gem.user_dir')"/bin:/home/paubie/.cabal-default-sandbox/.cabal-sandbox/bin/:."
export EDITOR=vim
export WINE_DEBUG=-all
export BROWSER=chromium
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
export NODE_REPL_HISTORY_FILE="$HOME/.nodehistory"
