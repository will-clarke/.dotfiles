#!/usr/bin/env sh

echo "This script will import your GPG key, SSH keys & pass store from an encrypted tar file"
echo ""
echo "Usage:"
echo "> $0 <path-to-encrypted-tar-file>"

# encrypted tar file should be $1. If not, error
if [ -z "$1" ]; then
	echo
	echo
	echo "Please provide the path to the encrypted tar file"
	exit 1
fi

encrypted_tar_file=$1

mkdir -p ~/secrets

# Decrypt the tar file
gpg --decrypt "$encrypted_tar_file" | tar -xzvf - -C ~/secrets

exit 1

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
