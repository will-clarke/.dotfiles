#!/usr/bin/env bash

mkdir -p ~/.config/{karabiner,helix,lf}

curl https://git.sr.ht/~will-clarke/.dotfiles/blob/master/config/.config/karabiner/karabiner.json -o ~/.config/karabiner/karabiner.json
curl https://git.sr.ht/~will-clarke/.dotfiles/blob/master/config/.config/helix/config.toml -o ~/.config/helix/config.toml

for f in lf_kitty_clean lf_kitty_preview lfrc
do
curl https://git.sr.ht/~will-clarke/.dotfiles/blob/master/config/.config/lf/$f -o ~/.config/lf/$f
done

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install shiftit --cask
brew install karabiner-elements --cask
brew install fish
brew install gpg
brew install pass
brew install pass-otp
brew install bat
brew install lf
brew install highlight
brew install coreutils
brew install zoxide
brew install fzf
brew install insomnia --cask
brew install google-chrome --cask
brew install --cask slack
brew install gnu-sed
brew install fd
brew install starship
brew install exa

fish_add_path "$HOMEBREW_PREFIX/bin"
fish_add_path ~/.cargo/bin

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term


git config --global url."git@github.com:".insteadOf https://github.com/


curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v5
fisher install PatrickF1/fzf.fish
fisher install edc/bass

brew tap homebrew/cask-fonts
brew install font-hasklig --cask

go install github.com/go-delve/delve/cmd/dlv@latest
