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
	echo "~/secrets/ is not empty. Please delete it and try again"
	exit 1
fi

# Decrypt the tar file
gpg --decrypt "$encrypted_tar_file" | tar -xzvf - -C ~/secrets

echo "more stuff to do in $0 - have a look!"

exit 0

# To retrieve the key:
# gpg --keyserver keyserver.ubuntu.com --recv-key FAC9C682056AADA1C28DDF2F9236EF59DDC42D53

# Import GPG key
gpg_secret_key_file=~/secrets/gpg-secret-key.txt
gpg --import "$gpg_secret_key_file"

# Import SSH keys to pass
find ~/.ssh -type f -not -name "id_rsa*" -not -name "id_dsa*" -not -name "known_hosts" | xargs -I "{}" sh -c 'pass insert -m ssh/$(basename {}) < {}'

echo
echo
echo
echo "Congrats"
echo "Imported GPG key, SSH keys, and pass store from $encrypted_tar_file"
echo
echo "You can now use your GPG key, SSH keys, and password store."
