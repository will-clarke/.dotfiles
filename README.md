My Mac Config Dotfiles
======================


Maybe do some of this stuff with a new mac:
(cribbed from https://www.atlassian.com/git/tutorials/dotfiles)

```sh
cd
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "*" >> .gitignore
git clone --bare <git-repo-url> $HOME/.cfg
config update-index --assume-unchanged
config config --local status.showUntrackedFiles no
config checkout
```
