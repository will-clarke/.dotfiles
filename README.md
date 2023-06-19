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
- `git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim`

Then

1. `git clone` this repo
2. `stow config` and anything else you may want

## 🔒 Git leaks 🔒

Probs makes sense to install gitleaks (`brew install gitleaks`) and use it as a pre-commit hook:
```sh
echo "gitleaks protect" > .git/hooks/pre-commit
```

## 💻 Different Binaries 💻

Since MacOS and Linux are slightly different, I've got two sets of executables.

## ⚡ TL;DR ⚡

```
cd $HOME
git clone https://git.sr.ht/will-clarke/.dotfiles
#  OR via ssh;
#  git clone git@git.sr.ht:~will-clarke/.dotfiles
cd .dotfiles && stow bin-mac config git

# Apply mac-specific settings
curl https://git.sr.ht/~will-clarke/.dotfiles/blob/master/docs/setup_new_mac.sh -o setup_new_mac.sh && chmod +x setup_new_mac.sh
vi setup_new_mac.sh
# if this look good...
# ./setup_new_mac.sh

# Install gitleaks
brew install gitleaks
echo "gitleaks protect" > .git/hooks/pre-commit

```
