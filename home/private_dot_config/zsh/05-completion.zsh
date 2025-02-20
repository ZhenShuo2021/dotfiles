# Setup completions
# =============================================================================
# 請注意自動補全的載入順序必須是 FPATH > compinit > zstyle，如果插件需要
# compdef/compinit、修改 FPATH 等等依賴，就需要手動調整順序在 completion 前載入

# This MUST run before compinit
eval $(/opt/homebrew/bin/brew shellenv)

# According to the zimfw documentation, we shouldn't run `compinit` again if `zmodule completion`  
# is used. However, removing these two lines would require placing `eval $(/opt/homebrew/bin/brew shellenv)`  
# before sourcing `zmodule completion`. Additionally, `zmodule` enforces execution in non-blocking mode,  
# significantly slowing down shell startup.  
# The current solution leverages `zsh-defer` to suppress all messages, eliminating any warnings.  

autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP"   # ZSH_COMPDUMP is configured in .zshenv

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' menu select   # better zsh-z completion
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Uncomment if $BREW_PATH/share/zsh/site-functions missing in FPATH
# if type brew &>/dev/null
# then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# fi

# uv (python)
eval "$(uv generate-shell-completion zsh)"
