[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
PROMPT='%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} $ '

# ~/.bash_profile

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'
alias ll='ls -l'
alias ddu='sh ~/Dropbox/Development/Themes\ WordPress/dobsondev-underscores/ddunderscores-osx.sh'
alias vi=nvim
alias vim=nvim

export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/opt/nvim-osx64/bin:$PATH"
export PATH="/usr/local/Cellar/ctags/5.8_1/bin:$PATH"

source ~/.ghcup/env

autoload -Uz compinit && compinit
