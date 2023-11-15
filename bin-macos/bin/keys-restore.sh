#!/usr/bin/env sh

echo "This script will import your GPG key, SSH keys & pass store from an encrypted tar file"
echo ""
echo "Usage:"
echo "> $0 <path-to-encrypted-tar-file>"
echo
echo

# encrypted tar file should be $1. If not, error
if [ -z "$1" ]; then
	echo
	echo
	echo "Please provide the path to the encrypted tar file"
	exit 1
fi

encrypted_tar_file=$1

mkdir -p ~/secrets
# if ~/secrets file isn't empty, raise an error

if [ -n "$(ls -A ~/secrets 2>/dev/null)" ]; then
	echo "$HOME/secrets/ is not empty. Please delete it and try again"
	exit 1
fi

# Decrypt the tar file
gpg --decrypt "$encrypted_tar_file" | tar -xzvf - -C ~/secrets

echo "more stuff to do in $0 - have a look!"

keys=$(find ~/secrets/keys/gpg/ -type f -name 'gpg-*' | sed -n 's/.*-\(0x[0-9A-Fa-f]\+\)\..*/\1/p' | sort | uniq)
for key in $keys; do
	# gpg --keyserver keyserver.ubuntu.com --recv-key "$key"
	pubic_key_file="$HOME/secrets/keys/gpg/public-key-$key.asc"
	secret_key_file="$HOME/secrets/keys/gpg/secret-key-$key.txt"
	gpg --dearmor "$pubic_key_file"
	dearmored_public_key="$pubic_key_file.gpg"
	paperkey --pubring "$dearmored_public_key" --secrets "$secret_key_file" | gpg --import
done

mkdir -p ~/.ssh
for ssh_key in ~/secrets/keys/ssh/*; do
	cp -n "$ssh_key" ~/.ssh/ # n == no clobber
done

if [ -n "$(ls -A ~/.password-store 2>/dev/null)" ]; then
	echo "$HOME/.password-store/ is not empty."
	echo "Copying password store to $HOME/.password-store2"
	cp -r ~/secrets/password-store/* ~/.password-store2/
else
	mkdir -p ~/.password-store
	cp -r ~/secrets/password-store/* ~/.password-store/
fi

rm -rf ~/secrets

echo "Do you want to remove the encrypted file? [y/N] " response
read -r response
case "$response" in
y)
	rm -f "$encrypted_tar_file"
	;;
esac
