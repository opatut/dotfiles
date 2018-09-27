#!/bin/bash

unset GREP_OPTIONS


function E() {
    # e $@
    gvim --role floating -geometry 100x24 $@
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
alias gs='git status'
alias git='hub'
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
alias d='docker'
alias genact='docker run -it --rm svenstaro/genact'
alias inode="node -i -e 'const lodash = require(\"lodash\"); for (const k in lodash) { global[\"_\" + k] = lodash[k]; }'"

export TERM=xterm-256color
export GOPATH=$HOME/src/go
export PATH="/usr/local/bin:/usr/lib/colorgcc/bin:/opt/android-sdk/platform-tools:$HOME/.android/sdk/platform-tools:$HOME/.android/sdk/tools:$HOME/.gem/ruby/2.1.0/bin:$HOME/.bin/:$(ruby -e 'puts Gem.user_dir')/bin:.:$HOME/.npm-global/bin/:$GOPATH/bin:$PATH:$HOME/.gem/ruby/2.4.0/bin"
export EDITOR=vim
export WINE_DEBUG=-all
export BROWSER=chromium
# export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
export NODE_REPL_HISTORY_FILE="$HOME/.nodehistory"
export NODE_PATH="$HOME/.npm-global/lib/node_modules"
export ANDROID_HOME=/opt/android-sdk
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export DEV_TOOL=eval
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE
export KOPS_STATE_STORE=s3://kops.mesaic.io

MESAIC_ROOT=$HOME/job/mesaic/mesaic
if [ -f "$MESAIC_ROOT/packages/mesaic-cli/mesaic.bashrc" ]; then
  source $MESAIC_ROOT/packages/mesaic-cli/mesaic.bashrc
  alias m=mesaic
  alias ml="mesaic logs"
  alias ms="mesaic start"
  alias mb="mesaic build"

  # mac: "mesaic (start) api-cli", e.g. "mac migrate" or "mac seed presets.dev"
  function mac() { 
      node $MESAIC_ROOT/packages/mesaic-cli start --no-build api-cli $@ | bunyan 
  }
fi

alias workflow="mysql -u root mesaic_dev -e 'select config from order_workflows where id = \"ac997b0b-f3d8-487a-968f-438b1993c673\";' -sN | jq"


function mesaic-logs () {
  project=$1
  shift
  pm2 logs --raw -f $project | bunyan $@
}

function mesaic-errors () {
  project=$1
  shift
  mesaic-logs $project -c '!this.req || this.err' $@
}

