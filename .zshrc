alias config='/usr/bin/git --git-dir=/Users/wmmc/.cfg/ --work-tree=/Users/wmmc'
export PATH=~/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.emacs.d/bin:$PATH
export PATH=~/.local/bin:$PATH

export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

export GO111MODULE=on
alias gomodon="export GO111MODULE=on"
alias gomodoff="export GO111MODULE=auto"
alias gomod="echo \$GO111MODULE"


if [ -x "$(command -v rbenv)" ]; then
    eval "$(rbenv init -)"
fi


if [ -e "/usr/local/share/antigen/antigen.zsh" ]; then
    source /usr/local/share/antigen/antigen.zsh

    antigen bundle git
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle zsh-users/zsh-completions
    antigen bundle command-not-found
    antigen bundle agkozak/zsh-z
    antigen theme denysdovhan/spaceship-prompt

    # antigen theme https://github.com/denysdovhan/spaceship-zsh-theme
    
    # if [[ "$OSTYPE" == "darwin"* ]]; then
    #     antigen bundle osx
    # fi

    antigen apply
fi

# Rails 6.0.2 doesn't play well with ruby 2.7.0
export RUBYOPT='-W:no-deprecated -W:no-experimental'


alias gs="git status"
alias gd="git diff"
alias gco="git checkout"

export PATH="/usr/local/sbin:$PATH"

makeopts(){
    make -pRrq : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($1 !~ "^[#.]") {print $1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^@$'
}

[[ -s "/Users/wmmc/.gvm/scripts/gvm" ]] && source "/Users/wmmc/.gvm/scripts/gvm"

export PERLLIB=/Library/Developer/CommandLineTools/usr/share/git-core/perl:$PERLLIB



# mkdir ~/docker
# docker create -v ~/docker/ubuntu-data-volume --name ubuntu-data-volume ubuntu
alias ubuntu="docker run -t -i --volumes-from ubuntu-data-volume ubuntu /bin/bash"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if [ -x "$(command -v starship)" ]; then
    eval "$(starship init zsh)"
fi

alias git-root='cd $(git rev-parse --show-cdup)'

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

export PATH="$HOME/.local/bin:$PATH"

# some oracle rubbish
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/oracle/instantclient/12.2.0.1"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOME/oracle/instantclient/12.2.0.1"

# some zlib compiler rubbish
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/zlib/lib/pkgconfig"
# ???? Is MacOS rubbish??
export CPATH=`xcrun --show-sdk-path`/usr/include

alias e="emacsclient -nc"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export AWS_SESSION_TOKEN_TTL=12h

# m == make but for anywhere in the directory
function m(){
    if [[ "$#" == 0 ]]
    then
        cmd="make"
    else
        cmd="make $*"
    fi
    (cd "$(git rev-parse --show-toplevel)" && eval "$cmd")
}
if [ -e /Users/itwc1/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/itwc1/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -x "$(command -v direnv)" ]; then
    eval "$(direnv hook zsh)"
fi
