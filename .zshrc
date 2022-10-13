## ZSH Settings
# Ignore Dupes in zsh

setopt HIST_IGNORE_ALL_DUPS

## Elixir settings

# History in IEX
export ERL_AFLAGS="-kernel shell_history enabled"


## ALIASES
alias gs='git status'
alias gd='git diff'
alias ll='ls -al'


## Open projects from terminal with `code .`
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# GPG Things

export GPG_TTY=$(tty)

# GIT COMPLETION
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

## PROMPT
setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Echoes information about Git repository status when inside a Git repository
git_info() {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local -a GIT_INFO
  GIT_INFO+=( "\033[38;5;15m($GIT_LOCATION)%{$reset_color%}" )
  echo "${GIT_INFO}"
}

export PS1='
%{$fg[cyan]%}%~%u $(git_info)
%(?.%{$fg[white]%}.%{$fg[red]%})|>%{$reset_color%} '

