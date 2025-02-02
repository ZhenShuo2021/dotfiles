# Load plugins
# ============================================================================

# Theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zsh-defer zinit snippet OMZL::git.zsh
zsh-defer zinit snippet OMZL::history.zsh

zsh-defer zinit snippet OMZP::docker
zsh-defer zinit snippet OMZP::docker-compose
zsh-defer zinit snippet OMZP::extract
zsh-defer zinit snippet OMZP::git

zsh-defer zinit light zsh-users/zsh-autosuggestions; bindkey ',' autosuggest-accept
zsh-defer zinit light zsh-users/zsh-completions
zsh-defer zinit light zsh-users/zsh-syntax-highlighting
zsh-defer zinit light agkozak/zsh-z

# https://github.com/zimfw/zimfw/issues/372
# zinit wait lucid for \
#   OMZL::git.zsh \
#   OMZL::history.zsh

# zinit wait lucid for \
#   OMZP::docker \
#   OMZP::docker-compose \
#   OMZP::extract \
#   OMZP::git

# zinit wait lucid for \
#   zsh-users/zsh-autosuggestions \
#   zsh-users/zsh-completions \
#   zsh-users/zsh-syntax-highlighting \
#   agkozak/zsh-z

# colored manpage
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


# Conflict: use either `zsh-history-substring-search` or `key-bindings`
# Also, I don't like substring search

zsh-defer zinit snippet OMZL::key-bindings.zsh
# zsh-defer zinit snippet OMZL::key-bindings.zsh
# zsh-defer zinit light zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


# optional plugins
# zsh-defer zinit light lukechilds/zsh-better-npm-completion


# deprecated plugins
# zsh-defer zinit snippet OMZL::completion   # brew fpath and zsh-completions are better

