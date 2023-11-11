#!/usr/bin/env sh

# brew install paperkey

echo "Probably worth stepping through this with nvim & sniprun (leader + o)"
# exit 1

email="wmmclarke@gmail.com"


### GPG
keyID=$(gpg --list-secret-keys | grep -A 3 expires | grep -B 1 "$email" | head -n1 | sed 's/ //g')
echo $keyID

mkdir -p ~/secrets
gpg --export-secret-key "$keyID" | paperkey --output-type raw | qrencode --8bit --output ~/secrets/secret-key.qr.png
gpg --export-secret-key "$keyID" | paperkey --output ~/secrets/secret-key.txt

# update pass ssh keys
fd . ~/.ssh | rg -v gpg | rg -v old | xargs -I "{}" sh -c 'cat {} | pass insert -m ssh/$(basename {})'

cp -r ~/.password-store/ ~/secrets/password-store

# To retrieve the key:
# gpg --keyserver keyserver.ubuntu.com --recv-key FAC9C682056AADA1C28DDF2F9236EF59DDC42D53
