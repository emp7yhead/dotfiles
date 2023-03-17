# Colors
autoload -U colors && colors

# Zsh plugins
source ~/antigen.zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen apply

zstyle :compinstall filename './.zshrc'
autoload -Uz compinit
compinit

# asdf
source $HOME/.asdf/asdf.sh
autoload -U +X bashcompinit && bashcompinit
source $HOME/.asdf/completions/asdf.bash

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Aliases
alias ..='cd ..'
alias reload="source ~/.zshrc"
alias ll="ls -la"
alias c="code ."
alias b="make build"
alias s="make start"
alias t="make test"
alias bst="make build && make start && make test"
alias v="nvim ."

# Python
export PATH="/Users/empty_head/.local/bin:$PATH"
# Starship
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

source /Users/empty_head/.docker/init-zsh.sh || true # Added by Docker Desktop
