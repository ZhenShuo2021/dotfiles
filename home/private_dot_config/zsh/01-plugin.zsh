# Preload anything we need for the rest of the rc scripts
# =============================================================================

# Install plugin manager and source it
zstyle ':zcomet:*' home-dir ~/.config/zsh/zcomet

if [[ ! -f ${ZDOTDIR:-${HOME}}/.config/zsh/zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.config/zsh/zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.config/zsh/zcomet/bin/zcomet.zsh


# load p10k
zcomet load romkatv/zsh-defer
zcomet load romkatv/powerlevel10k


# load plugins
zsh-defer zcomet load ohmyzsh plugins/extract
zsh-defer zcomet load ohmyzsh plugins/docker-compose   # only load completion
# zsh-defer zcomet load ohmyzsh plugins/git
# zsh-defer zcomet fpath ohmyzsh plugins/gitfast   # Same as homebrew's git completion


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
# zsh-defer zcomet load zsh-users/zsh-syntax-highlighting
zsh-defer zcomet load zdharma-continuum/fast-syntax-highlighting
zsh-defer zcomet load zsh-users/zsh-autosuggestions; bindkey '^f' autosuggest-accept


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
