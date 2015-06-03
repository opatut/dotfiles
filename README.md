# opatut Dotfiles

Copy your favourite files to your home directory.

Symlink all of them using

    ./create-symlinks.py

## Netctl Profiles

You can simply set up your profile for common networks (e.g. eduroam) by running `netctl/create-profile netctl/$profile-name`. It will ask you for you password.

## Local shell environment

To override your shell environment, copy `zsh/shell.local.example` to `~/.shell.local` and adjust. This file is sourced at the end, so you can override everything set in .zshrc etc.
