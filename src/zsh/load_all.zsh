# 
# Main script loads all zsh files for .zshrc
# 


# 先載入 zsh-defer
# ============================================================================

PLUGIN_DIR="$HOME/.local/share/zinit/plugins"
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light romkatv/zsh-defer


# Some useful constants
# ============================================================================

export PROJECTS=~/Code  # your project folder that we can `c [tab]` to
export PATH="$ZDOTFILES/src/bin:$PATH"
export EDITOR='code'

FPATH="$ZDOTFILES/src/fpath:$FPATH"
zsh-defer autoload -U $ZDOTFILES/src/fpath/*(:t)


# Setup completions
# ============================================================================
# 請注意自動補全的載入順序必須是 FPATH > compinit > zstyle，如果插件需要
# compdef/compinit、修改 FPATH 等等依賴，就需要手動調整順序

autoload -U compinit
zsh-defer compinit -d "$ZSH_COMPDUMP"   # ZSH_COMPDUMP is configured in .zshenv


# Load plugins
# ============================================================================

source $ZDOTFILES/src/zsh/plugins.zsh


# Load dotfiles
# ============================================================================

# zsh-defer -t 0.5 source $ZDOTFILES/src/zsh/alias.zsh   # 更晚載入避免被插件的延遲載入覆蓋
zsh-defer source $ZDOTFILES/src/zsh/alias.zsh
zsh-defer source $ZDOTFILES/src/zsh/completion.zsh
source $ZDOTFILES/src/zsh/system.zsh
