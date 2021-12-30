# 🖥 My Dotfiles 🖥

The aim is these should work both on MacOS & Linux.

I try to keep my tools simple. At the moment I like Doom emacs, the fish shell & tmux.
On MacOS, I use Karabiner for some better shortcuts / customisability.
On Linux I like Arch & Sway as a window manager.

## 🛠 Installation 🛠

Grab a copy of [GNU Stow](http://www.gnu.org/software/stow/)
One of these should work:

- `sudo apt install git stow`
- `sudo pacman -S git stow`
- `brew install stow`

Then

1. `git clone` this repo
2. `git submodule init` to grab all the other stuff
3. install doom emacs
4. `stow tmux` and anything else you may want

## 🚨 Git Submodule Alert! 🚨

There are some submodules attached which may live in private repos.
You may not have access to everything here.

## Different Binaries

Since MacOS and Linux are slightly different, I've got two sets of executables.

## ⚡ TL;DR ⚡

```
cd $HOME
git clone git@git.sr.ht:~will-clarke/.dotfiles --recursive
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
stow bin-{mac,linux} config emacs git org pass tmux stories
```

You may need to reinstall `fisher` packages to get `fish` working properly.

```
fisher remove < ~/.dotfiles/config/.config/fish/fish_plugins
fisher install < ~/.dotfiles/config/.config/fish/fish_plugins
```

# Some repos that may be useful

```sh
openssh-server
tailscale
tmux
htop
bat
ripgrep
postgresql
postgresql-contrib
git
curl
fish
stow
pass
pass-extension-otp

# if dealing with Ubuntu and dodgy wifi firmware
linux-headers-$(uname -r)
broadcom-sta-*
```
