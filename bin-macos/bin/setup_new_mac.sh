#!/usr/bin/env bash

cd && git clone https://git.sr.ht/~will-clarke/.dotfiles

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap homebrew/cask-fonts

brew install fish \
	gpg \
	pass \
	pass-otp \
	bat \
	lf \
	highlight \
	coreutils \
	zoxide \
	fzf \
	gnu-sed \
	fd \
	starship \
	exa \
	pgcli \
	stow \
	zellij \
	zoxide \
	postgresql@14 \
	flyctl \
	coreutils \
	gnu-sed \
	jq \
	terraform \
	ripgrep \
	imagemagick \
	elixir \
	elixir-ls \
	helix \
	goenv \
	git-delta

brew install --cask insomnia \
	google-chrome \
	slack \
	shiftit \
	karabiner-elements \
	font-go-mono-nerd-font \
	font-hasklig-nerd-font

fish_add_path "$HOMEBREW_PREFIX/bin"
fish_add_path ~/.cargo/bin

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# git clone https://github.com/helix-editor/helix
# cd helix
# cargo install --path helix-term

git config --global url."git@github.com:".insteadOf https://github.com/

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
fisher install mattgreen/lucid.fish
fisher install edc/bass

goenv install 1.19
go install github.com/go-delve/delve/cmd/dlv@latest

stow config
