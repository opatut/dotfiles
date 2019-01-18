#!/bin/bash

PATH=".:$PATH"
PATH="$HOME/.npm-global/bin/:$PATH"
PATH="$GOPATH/bin:$PATH"
if which ruby > /dev/null; then
  PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi
PATH="/usr/local/bin:$PATH"
PATH="/usr/lib/colorgcc/bin:$PATH"
PATH="/opt/android-sdk/platform-tools:$PATH"
PATH="$HOME/.android/sdk/platform-tools:$PATH"
PATH="$HOME/.android/sdk/tools:$PATH"
PATH="$HOME/.gem/ruby/2.1.0/bin:$PATH"
PATH="$HOME/.bin/:$PATH"
export PATH
