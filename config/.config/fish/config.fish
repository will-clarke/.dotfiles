if status is-interactive
    abbr --add --global gco git checkout
    abbr --add --global ga git add
    abbr --add --global gd git diff
    abbr --add --global gs git status
    abbr --add --global gdc git diff --cached
    fzf_configure_bindings --variables # C-V is an annoying default shortcut to use so we should disable it
end
