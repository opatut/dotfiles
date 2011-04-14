#!/bin/bash

MAKE_RULES=""
_get_make_rules() {
    MAKE_RULES=""
    if [[ -e Makefile ]]; then
        #for LINE in `cat Makefile`; do
        while read LINE; do
            LINE=$(echo $LINE | sed 's|#.*$||')
            cont=${LINE/://}
            if [[ $cont != $LINE ]]; then
                MAKE_RULES=$MAKE_RULES" "$(echo $LINE | sed 's|:.*$||')
            fi
        done < Makefile
    fi
}
_get_make_rules

function _make_autocomplete {
    COMPREPLY=()
    local cur="${COMP_WORDS[COMP_CWORD]}"
    _get_make_rules
    COMPREPLY=($(compgen -W "${MAKE_RULES}" -- ${cur}))
}

complete -F _make_autocomplete -o default make
