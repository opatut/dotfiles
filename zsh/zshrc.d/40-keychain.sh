if which keychain > /dev/null; then 
    eval `keychain --quiet --eval --agents ssh,gpg --timeout 5`
    # for file in id_rsa id_ecdsa; do
    #     [ -f ~/.ssh/$file ] && eval `keychain --quiet --eval --agents ssh`
    # done
fi
