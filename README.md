My Mac Config Dotfiles
======================

```sh
cd
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "*" >> .gitignore
git clone --bare <git-repo-url> $HOME/.cfg
config update-index --assume-unchanged
config config --local status.showUntrackedFiles no
config checkout
```
