set fish_greeting #disable welcome

abbr --add --global lua lua5.1
set -gx DYLD_LIBRARY_PATH  /usr/local/Cellar/imagemagick/7.1.1-22/lib

if type -q luarocks
    eval "$(luarocks path --bin)"

end


if status is-interactive
    abbr --add --global gco git checkout
    abbr --add --global gco. git checkout .
    abbr --add --global ga git add
    abbr --add --global gd git diff
    abbr --add --global gs git status
    abbr --add --global gdc git diff --cached
    abbr --add --global nn nnn -e
    abbr --add --global n nvim
    abbr --add --global e nvim
    abbr --add --global kit 'kitty --listen-on=/tmp/kitty_"$(date +%s%N)"'
    if type -q fzf_configure_bindings
        fzf_configure_bindings --variables # C-V is an annoying default shortcut to use so we should disable it
    end

    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
end

set PATH $PATH ~/.local/bin ~/.ghcup/bin
# set -x PYTHONPATH "$HOME/.config/kitty/mplbackend:$PYTHONPATH"
# set -x MPLBACKEND "module://matplotlib-backend-kitty"

if type -q goenv
    status --is-interactive; and source (goenv init -|psub)
end
set -x GO111MODULE on

if type -q zoxide
    zoxide init fish | source
end

# set -Ux HELIX_RUNTIME ~/code/helix/runtime
set -Ux ZK_NOTEBOOK_DIR ~/notes

# fisher should be separate & not checked into git
set -U -x fisher_path ~/.config/fisher
set -p fish_complete_path ~/.config/fisher/completions
set -p fish_function_path ~/.config/fisher/functions
for f in ~/.config/fisher/conf.d/*
    source $f
end

set -a fish_function_path ~/.config/fish/functions.local/

test -f ~/.config/fisher/functions/init.fish && source ~/.config/fisher/functions/init.fish
test -f ~/.config/fish/config-local.fish && source ~/.config/fish/config-local.fish


type -q starship && starship init fish | source

set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/anaconda3/bin/conda
    eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<


if test -f ~/.luaver/luaver.fish
    # source ~/.luaver/luaver.fish
end

# PREFIX=/usr/local/anaconda3

if type -q direnv
  direnv hook fish | source
end


if type -q starship
  starship init fish | source
end
abbr dbi python3 ~/bin/dbibackend

if status --is-interactive && type -q ssh-agent
    eval (ssh-agent -c) > /dev/null
    if test -f ~/.ssh/id_srht
        ssh-add -q ~/.ssh/id_srht
    end
    if test -f ~/.ssh/tumelo
        ssh-add -q ~/.ssh/tumelo
    end
end

if test -d ~/.colima
    export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
end

if test -f ~/.asdf/asdf.fish
    source ~/.asdf/asdf.fish
end

if test -f ~/.config/fish/z.fish
    source ~/.config/fish/z.fish
end
