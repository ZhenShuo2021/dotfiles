# 
# Main script loads all zsh files for .zshrc
# 


# Some useful constants
# ============================================================================

export PROJECTS=~/Code  # your project folder that we can `c [tab]` to
export PATH="$ZDOTFILES/src/bin:$PATH"
export EDITOR='code'

FPATH="$ZDOTFILES/src/fpath:$FPATH"
autoload -U $ZDOTFILES/src/fpath/*(:t)


# Setup completions
# ============================================================================
# 請注意自動補全的載入順序必須是 FPATH > compinit > zstyle，如果插件需要
# compdef/compinit、修改 FPATH 等等依賴，就需要手動調整順序

autoload -U compinit
compinit -d "$ZSH_COMPDUMP"   # ZSH_COMPDUMP is configured in .zshenv


# Load plugins
# ============================================================================
# 插件應該都以 *.plugin.zsh 結尾。

OMZ_DIR="$PLUGIN_DIR/ohmyzsh"
source $ZDOTFILES/src/zsh/plugins.zsh
source "$OMZ_DIR/oh-my-zsh.sh"   # OMZ cache and completions. Required by docker/git

load_omz_lib "git"
load_omz_lib "history"

autoload -Uz is-at-least   #  for docker plugin
load_omz_plugin "docker"
load_omz_plugin "docker-compose"
load_omz_plugin "extract"
load_omz_plugin "git"

load_plugin zsh-autosuggestions; bindkey ',' autosuggest-accept
load_plugin zsh-completions
load_plugin zsh-syntax-highlighting
load_plugin zsh-z

# colored manpage
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


# Conflict: use either `zsh-history-substring-search` or `key-bindings`. Also, I don't like substring search
load_omz_lib key-bindings
# load_plugin "zsh-history-substring-search"
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


# optional plugins
# load_plugin zsh-better-npm-completion


# deprecated plugins
# load_omz_lib completion   # brew fpath and zsh-completions are better


# Load zsh theme
# ============================================================================
# 載入 zsh 主題，應該在最後載入並且不使用延遲載入

# p10k
source $PLUGIN_DIR/powerlevel10k/powerlevel10k.zsh-theme

# pure
# fpath+=($PLUGIN_DIR/pure)
# autoload -U promptinit; promptinit
# prompt pure


# Load dotfiles
# ============================================================================

source $ZDOTFILES/src/zsh/alias.zsh
source $ZDOTFILES/src/zsh/completion.zsh
source $ZDOTFILES/src/zsh/system.zsh
