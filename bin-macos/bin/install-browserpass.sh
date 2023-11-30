#!/usr/bin/env sh

mkdir -p ~/code
cd ~/code || exit 1
git clone https://github.com/browserpass/browserpass-native.git
cd browserpass-native/ || exit 1
make browserpass
sudo make BIN=browserpass-darwin64 PREFIX=/usr/local install # Install the app
mv /usr/local/bin/browserpass-darwin64 /usr/local/bin/browserpass-darwin64.bak
make PREFIX=/usr/local hosts-chrome-user
make PREFIX=/usr/local policies-chrome-user
