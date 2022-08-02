### Path

## Ref http://superuser.com/questions/544989/does-tmux-sort-the-path-variable/583502#583502
if test -f /etc/profile; then
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

alias date_l_ymd='date "+%Y%m%d"'
alias date_u_ymd='date -u "+%Y%m%d"'
alias date_l_ymdhm='date "+%Y%m%d%H%M"'
alias date_u_ymdhm='date -u "+%Y%m%d%H%M"'
alias date_l_ymdhms='date "+%Y%m%d%H%M%S"'
alias date_u_ymdhms='date -u "+%Y%m%d%H%M%S"'
alias grep='grep --colour'

alias e='emacs -nw -Q --eval '"'"'(setq-default make-backup-files nil)'"'"' --eval '"'"'(setq-default auto-save-default nil)'"'"
alias em='emacs -nw'
alias emacs-prelude='emacs-prelude -nw'

alias g='git'
alias gg='git grep'

### Functions

### Extra (pre)

if test -f "${HOME:?}"/.bash_extra_pre; then
    source "${HOME:?}"/.bash_extra_pre
fi

### OS-specific bits

function is_osx() { ## Ref https://github.com/cowboy/dotfiles/blob/8e4fa2a5d8f511cf5410d2f80fadd7450d3c131b/bin/dotfiles#L42-L44
    test -z "${OSTYPE##darwin*}"
}

if is_osx; then

    HOMEBREW_CASK_APPDIR="${HOME:?}/Applications"

    ## Ref https://github.com/Homebrew/brew/blob/8a153de2bc6a335080d877c0eb14d71e2ff8c537/docs/Manpage.md#environment
    export HOMEBREW_CACHE="${HOME:?}"/Library/Caches/Homebrew
    export HOMEBREW_CASK_OPTS="--no-binaries --appdir=${HOMEBREW_CASK_APPDIR:?}"
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_INSTALL_UPGRADE=1

    ## Ref https://github.com/Homebrew/brew/blob/2c83ea7339df5ae4d63b0eeb810f638f6d2cc7ca/docs/Manpage.md#shellenv
    eval $("${HOME:?}"/homebrew/bin/brew shellenv)
    : ${PATH:?}
    : ${MANPATH:?}
    : ${INFOPATH:?}
    : ${HOMEBREW_PREFIX:?}
    : ${HOMEBREW_CELLAR:?}
    : ${HOMEBREW_REPOSITORY:?}

    ### Path

    export PATH="${HOMEBREW_PREFIX:?}/opt/python/libexec/bin${PATH+:$PATH}"
    export PATH="${HOMEBREW_CASK_APPDIR:?}"/Docker.app/Contents/Resources/bin"${PATH+:$PATH}"
    export PATH="${HOME:?}/bin${PATH+:$PATH}"

    ### Prompt

    if test -f "${HOMEBREW_PREFIX:?}/etc/bash_completion.d/git-prompt.sh"; then
        source "${HOMEBREW_PREFIX:?}/etc/bash_completion.d/git-prompt.sh"
    fi

    ### Extra

    if test -r "${HOMEBREW_PREFIX:?}/etc/bash_completion"; then
        source "${HOMEBREW_PREFIX:?}/etc/bash_completion"
    fi
    if test -f "${HOMEBREW_PREFIX:?}/etc/bash_completion.d/git-completion.bash"; then
        source "${HOMEBREW_PREFIX:?}/etc/bash_completion.d/git-completion.bash"
        __git_complete g __git_main
    fi

    unset HOMEBREW_CASK_APPDIR

else

    echo "Untested code path" >&2

    ### Path

    export PATH="${HOME:?}/bin${PATH+:$PATH}"

fi

unset -f is_osx

### Extra (post)

if test -f "${HOME:?}"/.bash_extra_post; then
    source "${HOME:?}"/.bash_extra_post
fi
