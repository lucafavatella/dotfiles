## Copyright (C) 2013-2015 Luca Favatella <slackydeb@gmail.com>

### Path

## Ref http://superuser.com/questions/544989/does-tmux-sort-the-path-variable/583502#583502
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

### Prompt

export GIT_PS1_SHOWDIRTYSTATE=x
export GIT_PS1_SHOWUNTRACKEDFILES=x
export GIT_PS1_DESCRIBE_STYLE=branch
export PS1='$? \w$(__git_ps1 " (%s)") $ '

### Exports

### Aliases

alias ll='ls -la'
alias grep='grep --colour'

alias e='emacs -Q'
alias em='emacs'
alias emacs-prelude='env HOME=$HOME/.emacs-prelude.d emacs'

alias g='git'
alias gg='git grep'
alias ggi='git grep -i'

### Functions

### Extra

[ -f .bash_extra ] && source .bash_extra ## Ref https://github.com/mathiasbynens/dotfiles/blob/c31450229d943144e6e71a1435a02b94c2916af9/.bash_profile#L8

### OS-specific bits

function is_osx() { ## Ref https://github.com/cowboy/dotfiles/blob/8e4fa2a5d8f511cf5410d2f80fadd7450d3c131b/bin/dotfiles#L42-L44
    [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

if [ is_osx ]; then

    BREW_PREFIX=$(PATH="${HOME}/bin:$PATH" brew --prefix)

    ### Path

    export PATH="${HOME}/bin:${BREW_PREFIX}/bin:$PATH"

    ### Prompt

    if [ -f "${BREW_PREFIX}/etc/bash_completion.d/git-prompt.sh" ]; then
        source "${BREW_PREFIX}/etc/bash_completion.d/git-prompt.sh"
    fi

    ### Extra

    if [ -f "${BREW_PREFIX}/etc/bash_completion" ]; then
        source "${BREW_PREFIX}/etc/bash_completion"
    fi
    if [ -f "${BREW_PREFIX}/etc/bash_completion.d/git-completion.bash" ]; then
        source "${BREW_PREFIX}/etc/bash_completion.d/git-completion.bash"
        complete -o default -o nospace -F _git g ## Ref https://github.com/mathiasbynens/dotfiles/blob/c31450229d943144e6e71a1435a02b94c2916af9/.bash_profile#L35-L38
    fi

    ##

    unset BREW_PREFIX

else

    echo "Untested code path" >&2

    ### Path

    export PATH="${HOME}/bin:$PATH"

fi
