# Setup completions
# ============================================================================
# 請注意自動補全的載入順序必須是 FPATH > compinit > zstyle，如果插件需要
# compdef/compinit、修改 FPATH 等等依賴，就需要手動調整順序在 completion 前載入

autoload -U compinit
compinit -d "$ZSH_COMPDUMP"   # ZSH_COMPDUMP is configured in .zshenv

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' menu select

# Uncomment if $BREW_PATH/share/zsh/site-functions missing in FPATH
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
