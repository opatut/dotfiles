#!/bin/bash

alias bootlog='sudo journalctl -b'
alias clip='xclip -selection clipboard'
alias clocksync='sudo ntpd -qg && sudo hwclock --systohc'
alias csv='tabview -w max'
alias date1='date +"%Y%m%d%H%M%S"'
alias date2='date +"%Y-%m-%d-%H-%M-%S"'
alias date3='date +"%Y%m%d-%H%M%S"'
alias date4='date +"%Y-%m-%d %H:%M:%S"'
alias gls='git status'
alias gs='git status'
if which hub > /dev/null; then
  alias git='hub'
fi
alias gwd='git wdiff'
alias gpn='git push --no-verify'
alias gcn='git commit --no-verify'
alias guc='git uncommit'
alias pl='pm2 list'
alias grep='grep --color=auto'
alias jsonformat='python -m json.tool | pygmentize -l json -f terminal256'
alias la='ls -lvha'
alias less='less -S'
alias ll='ls -lvh'
alias ls='ls --group-directories-first -v --color=auto'
alias mdless='pandoc -s -f markdown -t man !* | groff -T utf8 -man | less'
alias mysql='mysql --auto-rehash'
alias sqlite='python2 -c "import apsw;apsw.main()"'
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
alias wgetpaste='wgetpaste -C'
alias yaourt='PKGEXT=.tar yaourt'
alias p='pass show --clip'
alias jan='yarn'
alias k='kubectl'
alias kf='kubectl -n foo'
alias caro='cargo run -q --'
alias pr='hub pull-request | clip'
alias genact='docker run -it --rm svenstaro/genact'
alias inode="node -i -e 'const lodash = require(\"lodash\"); for (const k in lodash) { global[\"_\" + k] = lodash[k]; }'"

# Docker

alias d='docker'
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dr='docker restart'
alias ds='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Image}}"'
da() { docker $@ $(docker ps -q) }
daa() { docker $@ $(docker ps -qa) }

# Editor (new GVIM instance)
function E() { gvim --role floating -geometry 100x24 $@ }
# accompanied by binary in ~/.bin/e

