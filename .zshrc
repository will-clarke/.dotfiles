alias config='/usr/bin/git --git-dir=/Users/wmmc/.cfg/ --work-tree=/Users/wmmc'
export PATH=~/bin:$PATH
export PATH=~/go/bin:$PATH

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
    antigen theme https://github.com/denysdovhan/spaceship-zsh-theme
    antigen apply
fi
