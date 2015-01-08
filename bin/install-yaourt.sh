#!/bin/bash

DIR=/tmp/install-yaourt
AUR=https://aur.archlinux.org/packages

download() {
    wget $1 || curl $1 > PKGBUILD
}

mkdir -p $DIR/package-query
cd $DIR/package-query/
download $AUR/pa/package-query/PKGBUILD
makepkg -si

mkdir -p $DIR/yaourt
cd $DIR/yaourt
download $AUR/ya/yaourt/PKGBUILD
makepkg -si

cd
rm -r $DIR
