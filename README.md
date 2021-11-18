# My Super Cool Dotfiles ʘ‿ʘ

The aim is these should work both on MacOS & Linux
Mainly emacs & command-line utilities...

## Installation
Grab a copy of [[http://www.gnu.org/software/stow/][GNU Stow]]
  - ~sudo apt-get install git stow~
  - ~sudo pacman -S git stow~
  - ~brew install stow~

GNU Stow is super cool. You should use it too.
Then 
1. `git clone` this repo
2. `git submodule init` to grab all the other stuff
3. install doom emacs
4. `stow tmux` and anything else you may want

## Git Submodule Alert! :rotating_light:
There are some submodules attached which may live in private repos. 
You may not have access to everything here.

## Different Binaries
Since MacOS and Linux have slightly different systems, I've got two sets of executables.

## TL;DR
```
cd $HOME
git clone git@git.sr.ht:~will-clarke/.dotfiles --recursive
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
stow bin-{mac,linux} config emacs git org pass tmux
```
