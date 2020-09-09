# My Mac Config Dotfiles

Maybe do some of this stuff with a new mac:
(cribbed from https://www.atlassian.com/git/tutorials/dotfiles)

```sh
cd

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "*" >> .gitignore
git clone --recurse-submodules --bare git@gitlab.com:will-clarke/mac-config.git $HOME/.cfg
config update-index --assume-unchanged README.md
rm README.md
config config --local status.showUntrackedFiles no
```

May have to

```sh
config checkout

config submodule init
```

How I installed this on a new mac 08/20:

```
# get homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew cask install flux
brew cask install karabiner-elements
brew cask install shiftit
brew cask install alacritty
brew install pass
brew install cmake

# install emacs gui for osx
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app
brew services start d12frosted/emacs-plus/emacs-plus@27


** ON OTHER COMPUTER **
1. copy ~/.ssh/id_rsa & id_rsa.pub file (preferably by physical storage)
2. If copying SSH key over electronically, remember to use gpg symmetrically:
        gpg --output clevername.gpg ~/.ssh/id_rsa --symmetric
3. Maybe add gpg keys too:
gpg --export-secret-keys  wmmclarke@gmail.com > private-gpg-key
gpg --armor --output public-key.gpg --export wmmclarke@gmail.com
zip wow.zip private-gpg-key public-key.gpg
gpg --output omgomg.gpg --symmetric wow.zip

** BACK ON NEW COMPUTER **
brew install gpg
gpg --decrypt clevername.gpg > ~/.ssh/id_rsa
chmod  400 ~/.ssh/id_rsa

# set up "config" to work - needs ssh key first
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "*" >> .gitignore
git clone --recurse-submodules --bare git@gitlab.com:will-clarke/mac-config.git $HOME/.cfg
config config --local status.showUntrackedFiles no

config submodule init
config submodule update

~/.emacs.d/bin/doom upgrade # will take ages

gpg wow.zip
unzip wow
gpg --list-keys
gpg --list-secret-keys
gpg --import public-key.gpg
gpg --import private-gpg-key
gpg --list-keys
gpg --list-secret-keys
pass list

```

go get golang.org/x/tools/gopls@latest
go get -u github.com/motemen/gore/cmd/gore
go get -u github.com/stamblerre/gocode
go get -u golang.org/x/tools/cmd/godoc
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/cweill/gotests/...
go get -u github.com/fatih/gomodifytags
go get -u github.com/golang/mock/mockgen@v1.4.3

curl -fsSL https://starship.rs/install.sh | bash

brew install ripgrep
brew install tmux
brew install fd
brew install coreutils
brew install graphviz
brew install jq
brew install shellcheck
brew cask install macdown
brew install markdown
brew install rust-analyzer
brew install michaeleisel/zld/zld # for rust performance

brew install exercism
brew install prettier

# haskell

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
curl -sSL https://get.haskellstack.org/ | sh

git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules ~/code/tmp/haskell-ide-engine
cd ~/code/tmp/haskell-ide-engine
stack ./install.hs help # will take bloody ages
stack ./install.hs hie

stack install brittany
stack install hoogle
stack install ghcid
stack install hlint

<!-- brew install cabal-install ghc -->
<!-- brew install haskell-stack -->
<!-- stack setup -->
<!-- stack install ghc-mod -->
<!-- stack install hoogle -->

brew install node
npm -g install js-beautify
npm -g install stylelint

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
