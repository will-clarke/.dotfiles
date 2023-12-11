#!/bin/sh

if pgrep "kitty" >/dev/null; then
	# switch to running kitty instance
	open -a kitty
else
	# no kitty instance ... open one!
	fish -c "cd $HOME && kitty"
fi
