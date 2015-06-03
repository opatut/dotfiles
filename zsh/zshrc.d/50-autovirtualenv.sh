# Source this file in your ~/.bashrc or ~/.zshrc.
# Use 'mkvirtualenv' to create a new virtual environment in your current
# directory. Adjust $ENVDIR if you want to name it differently.
# Add $ENVDIR to your global .gitignore etc.

ENVDIR=.pyenv

# Here be drangons.

function _find_virtualenv () {
    if [ -f "$1/$ENVDIR/bin/activate" ]; then
        echo "$1/$ENVDIR"
    elif [[ "$1" != "/" ]]; then
        _find_virtualenv $(dirname $1)
    fi
}

function _auto_virtualenv () {
    VE=$(_find_virtualenv $PWD)

    if [ -n "$VE" ]; then
        if [[ "$VE" != "$VIRTUAL_ENV" ]]; then
            source $VE/bin/activate
        fi
    elif [ -n "$VIRTUAL_ENV" ]; then
        deactivate
    fi
}

function mkvirtualenv {
    virtualenv $@ $ENVDIR

    #trigger directory "change" (chpwd)
    cd $PWD
}


# find out which shell we're using
SH=$(ps -hp $$ | awk '{print $5}')

if [[ "$SH" == *zsh ]]; then
    chpwd_functions+=('_auto_virtualenv')
elif [[ "$SH" == "bash" ]]; then
    PROMPT_COMMAND="_auto_virtualenv;"$PROMPT_COMMAND
else
    echo "auto-virtualenv.sh does not support your shell: $SH"
    echo "Go to github and submit a pull request for your shell."
    echo "https://github.com/opatut/dotfiles/tree/master/auto-virtualenv.sh"
fi
