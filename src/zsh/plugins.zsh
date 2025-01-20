# Load plugins
# ============================================================================
# Theme
zinit ice depth=1; zinit light romkatv/powerlevel10k


# Load plugins
# ============================================================================

zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh

zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::extract
zinit snippet OMZP::git

zinit light zsh-users/zsh-autosuggestions; bindkey ',' autosuggest-accept
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light agkozak/zsh-z

# Furthermore, instant prompt is indeed faster than zsh-defer
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


# Conflict: use either `zsh-history-substring-search` or `key-bindings`. Also, I don't like substring search

zinit snippet OMZL::key-bindings.zsh
# zinit snippet OMZL::key-bindings.zsh
# zinit light zsh-users/zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


# optional plugins
# zinit light lukechilds/zsh-better-npm-completion


# deprecated plugins
# zinit snippet OMZL::completion   # brew fpath and zsh-completions are better

