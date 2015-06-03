
makelocal () {
    if [[ -f Makefile.local ]]; then
        make -f Makefile.local $@
    else
        make $@
    fi
}

alias make='makelocal'
