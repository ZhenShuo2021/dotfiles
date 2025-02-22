# Preload anything we need for the rest of the rc scripts
# =============================================================================

# Install plugin manager and source it
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh


# load p10k
zcomet load romkatv/zsh-defer
zcomet load romkatv/powerlevel10k


# load plugins
zsh-defer zcomet load ohmyzsh plugins/extract
zsh-defer zcomet load ohmyzsh plugins/git


# configure zsh-history-substring-search
zsh-defer zcomet load zsh-users/zsh-history-substring-search

# Only search full prefix match
HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# custom substring highlight color
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold,bg=cyan'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=white,bold,bg=red'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=2

# disable substring match highlighting
zsh-defer unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
zsh-defer unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# plugins that must be loaded last
zsh-defer zcomet load agkozak/zsh-z
zsh-defer zcomet load zsh-users/zsh-completions
zsh-defer zcomet load zsh-users/zsh-syntax-highlighting
zsh-defer zcomet load zsh-users/zsh-autosuggestions; bindkey '^f' autosuggest-accept


# zcomet compinit doesn't help in my zshrc, see completion.zsh
# zsh-defer zcomet compinit


# optional plugins
# zcomet load lukechilds/zsh-better-npm-completion


# deprecated plugins
# zcomet load ohmyzsh lib completion.zsh   # brew fpath and zsh-completions are better


# colored manpage
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
