if status is-interactive
    abbr --add --global gco git checkout
    abbr --add --global ga git add
    abbr --add --global gd git diff
    abbr --add --global gs git status
    abbr --add --global gdc git diff --cached
    if type -q fzf_configure_bindings
        fzf_configure_bindings --variables # C-V is an annoying default shortcut to use so we should disable it
    end
end

if [ -z $DISPLAY ] && [ (tty) = /dev/tty1 ]
    exec sway
end

# Created by `pipx` on 2022-03-30 10:24:16
set PATH $PATH /Users/wmmc/.local/bin
