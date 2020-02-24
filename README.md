My Mac Config Dotfiles
======================


Maybe do some of this stuff with a new mac:
(cribbed from https://www.atlassian.com/git/tutorials/dotfiles)

```sh
cd

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "*" >> .gitignore
git clone --recurse-submodules --bare git@gitlab.com:will-clarke/mac-config.git $HOME/.cfg
config update-index --assume-unchanged
config config --local status.showUntrackedFiles no
```

May have to

```sh
config checkout

config submodule init
```