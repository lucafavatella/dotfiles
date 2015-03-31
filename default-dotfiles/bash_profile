## Copyright (C) 2013-2015 Luca Favatella <slackydeb@gmail.com>

# export HOMEBREW_CACHE=$HOME/Library/Caches/Homebrew
export HOMEBREW_CASK_OPTS="--debug --appdir=~/Applications --caskroom=~/homebrew-cask"

HOMEBREW_PATH=$HOME/homebrew/bin ## HOMEBREW_PATH=$HOME/homebrew/sbin:$HOME/homebrew/bin

export PATH=$HOMEBREW_PATH:$PATH

if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
     . $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=x
export GIT_PS1_SHOWUNTRACKEDFILES=x
export GIT_PS1_DESCRIBE_STYLE=branch
export PS1='$? \w$(__git_ps1 " (%s)") $ '

alias ll='ls -l'
alias grep='grep --color'
alias g='git'
alias gg='git grep'
alias em='emacs'
alias emc='emacsclient'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
     . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi
