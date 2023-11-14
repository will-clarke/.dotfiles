#!/usr/bin/env sh

# brew install paperkey
echo "This script will copy your GPG key, ssh keys & pass store to an encypted tar file"
echo ""
echo "Usage:"
echo "> $0 <your-email-address>"

# email should be $1. If not, error

if [ -z "$1" ]; then
	echo
	echo
	echo "Please pass in your email address"
	exit 1
fi

email=$1

### GPG
# keyID=$(gpg --list-secret-keys | grep -A 3 expires | grep -B 1 "$email" | head -n1 | sed 's/ //g')
keyID=$(gpg --list-keys --keyid-format LONG "$email" | grep '^pub' | grep -v expired | awk '{print $2}' | sed 's/.*\/\(.*\)$/\1/')

mkdir -p ~/secrets
cp ~/bin/keys-* ~/secrets
gpg --export-secret-key "$keyID" | paperkey --output-type raw | qrencode --8bit --output ~/secrets/gpg-secret-key.qr.png
gpg --export-secret-key "$keyID" | paperkey --output ~/secrets/gpg-secret-key.txt

# update pass ssh keys
# shellcheck disable=SC2016
fd . ~/.ssh | rg -v gpg | rg -v old | xargs -I "{}" sh -c 'cat {} | pass insert -m ssh/$(basename {})'

# copy over entire pass store
cp -r ~/.password-store/ ~/secrets/password-store
rm -rf ~/secrets/password-store/.git

# tar the secrets directory and encrypt it with a basic symmetrical password
tar -czvf ~/secrets.tar.gz -C ~/secrets .

gpg --symmetric --cipher-algo AES256 ~/secrets.tar.gz
rm -rf ~/secrets
rm ~/secrets.tar.gz

echo
echo
echo
echo "Congrats"
echo "Created ~/secrets.tar.gz.gpg"
echo
echo "You can now move the encrypted ~/secrets.tar.gz.gpg file to a safe location"
