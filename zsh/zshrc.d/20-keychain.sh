for file in id_rsa id_ecdsa; do
	[ -f ~/.ssh/$file ] && eval `keychain --quiet --eval --agents ssh $file`
done
