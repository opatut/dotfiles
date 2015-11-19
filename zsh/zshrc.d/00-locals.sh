DIR="$DOTFILES/zsh/zshrc.d/"$(hostname)"/"

if [[ -d $DIR ]]; then
    for file in $DIR/*.sh; do
        source $file
    done
fi
