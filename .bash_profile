## Copyright (C) 2013-2015 Luca Favatella <slackydeb@gmail.com>

### Path

### Prompt

export GIT_PS1_SHOWDIRTYSTATE=x
export GIT_PS1_SHOWUNTRACKEDFILES=x
export GIT_PS1_DESCRIBE_STYLE=branch
export PS1='$? \w$(__git_ps1 " (%s)") $ '

### Exports

### Aliases

alias ll='ls -la'
alias grep='grep --colour'

alias em='emacs'

alias g='git'
alias gg='git grep'

### Functions

### Extra

[ -f .bash_extra ] && source .bash_extra ## Ref https://github.com/mathiasbynens/dotfiles/blob/c31450229d943144e6e71a1435a02b94c2916af9/.bash_profile#L8

### OS-specific bits

function is_osx() { ## Ref https://github.com/cowboy/dotfiles/blob/8e4fa2a5d8f511cf5410d2f80fadd7450d3c131b/bin/dotfiles#L42-L44
    [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

if [ is_osx ]; then

    ### Path
    HOMEBREW_PATH=$HOME/homebrew/bin
    export PATH=$HOMEBREW_PATH:$PATH
    unset HOMEBREW_PATH

    ### Prompt
    if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
        source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
    fi

    ### Exports
    export HOMEBREW_CASK_OPTS="--caskroom=~/homebrew-cask"

    ### Extra
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        source $(brew --prefix)/etc/bash_completion
    fi
    if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
        source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
        complete -o default -o nospace -F _git g ## Ref https://github.com/mathiasbynens/dotfiles/blob/c31450229d943144e6e71a1435a02b94c2916af9/.bash_profile#L35-L38
    fi
fi
