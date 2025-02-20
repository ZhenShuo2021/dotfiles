# 設定常數在後續腳本使用
# =============================================================================

# Path which point to this dotfile, also used in fpath/bin/git alias
CM_ZSH_DIR=$HOME/.local/share/chezmoi/home/private_dot_config/zsh
CM_ZSH_PREFERENCE=$CM_ZSH_DIR/00-preference.zsh
CM_ZSH_ALIAS=$CM_ZSH_DIR/99-alias.zsh

# Path which point to dest files. you can edit and use `chezmoi add`
# to update the original git repo (a.k.a CM_ZSH_DIR)
ZZ=$HOME/.config/zsh
ZZ_PREFERENCE=$ZZ/00-preference.zsh
ZZ_ALIAS=$ZZ/99-alias.zsh

if [[ -a $HOME/.localrc ]]; then source $HOME/.localrc; fi   # for sensitive information


# User Preferences
# =============================================================================
# This area is freely modifiable

# Setup your locale
export LANG=zh_TW.UTF-8
export LC_ALL=zh_TW.UTF-8

# Other settings
# Auto-refresh GPG terminal detection
export GPG_TTY=$(tty)

# Clear text after exiting git pager mode
export LESS=FR

# Add paths
export PATH="$HOME/.local/bin:$PATH"

# Add paths
export PATH="$ZZ/bin:$PATH"

# Add paths
export PATH="/run/current-system/sw/bin:$PATH"

# Set Nix path
export NIX_PATH="nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs"

# Change zsh-z .z location
export ZSHZ_DATA="$XDG_CACHE_HOME/zsh/.z"

# Change .lesshst location
export LESSHISTFILE="$XDG_CACHE_HOME/zsh/.lesshst"

# Change .vimrc location
export VIMINIT="$XDG_CONFIG_HOME/vim/.vimrc"

# Change .gitconfig location
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/.gitconfig"

# Change .matplotlib location
export MPLCONFIGDIR="$XDG_CONFIG_HOME/.matplotlib"

# Disable homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

# Disable hints
export HOMEBREW_NO_ENV_HINTS=1

# your project folder that we can `c [tab]` to
export PROJECTS=~/Code
export EDITOR='nvim'

# zsh history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000


# Load FPATH for functions and completions
# =============================================================================

FPATH="$CM_ZSH_DIR/fpath:$FPATH"
autoload -U $CM_ZSH_DIR/fpath/*(:t)
