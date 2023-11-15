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

mkdir -p ~/secrets/keys

email=$1

### GPG
# keyID=$(gpg --list-secret-keys | grep -A 3 expires | grep -B 1 "$email" | head -n1 | sed 's/ //g')
masterKeyID=$(gpg --list-keys --keyid-format LONG "$email" | grep '^pub' | grep -v expired | awk '{print $2}' | sed 's/.*\/\(.*\)$/\1/')
allKeys=$(gpg --list-secret-keys "$masterKeyID" | awk '/sec|ssb/ {print $2}' | sed 's/.*\/\(.*\)$/\1/')

keyservers="pgp.mit.edu pgp.surf.nl keys.openpgp.org keyserver.ubuntu.com"

for key in $allKeys; do

	echo "Backing up key: $key"
	for keyserver in $keyservers; do
		gpg --keyserver "$keyserver" --send-keys "$key"
	done
	gpg --export-secret-keys "$key" | paperkey --output "$HOME/secrets/keys/gpg-secret-key-$key.txt"
	gpg --export-secret-keys "$key" | paperkey --output-type raw | qrencode --8bit --output "$HOME/secrets/keys/gpg-secret-key-$key.qr.png"
	gpg --export --armor "$key" >"$HOME/secrets/keys/gpg-public-key-$key.asc"

done

cp ~/bin/keys-* ~/secrets

# pgp.mit.edu
# pgp.surf.nl
# keys.openpgp.org
# keyserver.ubuntu.com
#
# gpg --keyserver keys.openpgp.org --send-keys 0x9236EF59DDC42D53 0x9A8A5C5E771783ED
# gpg --keyserver keyserver.ubuntu.com --send-keys 0x9236EF59DDC42D53 0x9A8A5C5E771783ED

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
