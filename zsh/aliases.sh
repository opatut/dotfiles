#!/bin/bash

alias spacman='sudo pacman'
alias sc='sudo systemctl'
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

alias _='sudo'

alias yaourt='PKGEXT=.tar yaourt'

alias such='git'
alias very='git'
alias much='git'
alias wow='git status'

alias open='xdg-open'

alias less='less -S'
alias d='docker'
alias gulp='node_modules/.bin/gulp'

alias co='git checkout'

export PATH="/usr/lib/colorgcc/bin:"$HOME"/.android/sdk/platform-tools:"$HOME"/.android/sdk/tools:"$PATH":"$HOME"/.gem/ruby/2.1.0/bin:"$HOME"/.bin/:"$(ruby -e 'puts Gem.user_dir')"/bin:/home/paubie/.cabal-default-sandbox/.cabal-sandbox/bin/:."
export EDITOR=vim
export WINE_DEBUG=-all
export BROWSER=chromium
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk

eval `keychain --quiet --eval --agents ssh ~/.ssh/id_rsa`

#source $(which virtualenvwrapper.sh)

makelocal () {
    if [[ -f Makefile.local ]]; then
        make -f Makefile.local $@
    else
        make $@
    fi
}

alias make='makelocal'

unset GREP_OPTIONS
alias grep='grep --color=auto'

eval "$(rbenv init -)"

# Setup ROS

# ROS
indigo() {
    CATKIN_SHELL=zsh
    source /opt/ros/indigo/setup.sh

    export PYTHONPATH=/opt/ros/indigo/lib/python2.7/site-packages:$PYTHONPATH
    export PKG_CONFIG_PATH="/opt/ros/indigo/lib/pkgconfig:$PKG_CONFIG_PATH"

    export ROS_PACKAGE_PATH=/home/paubie/uni/ros/:$ROS_PACKAGE_PATH
    export ROS_WORKSPACE=/home/paubie/uni/ros/

    # Useful aliases
    alias catkin_make="catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"

    # If you use Gazebo:
    source /usr/share/gazebo/setup.sh
}

export NODE_REPL_HISTORY_FILE="$HOME/.nodehistory"

#eval $(dircolors ~/.dircolors)

source $DOTFILES/zsh/auto-virtualenv.sh
