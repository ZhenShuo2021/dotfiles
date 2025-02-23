# Setup completions
# =============================================================================
# 請注意自動補全的載入順序必須是 FPATH > zstyle > compinit，如果插件需要
# compdef/compinit、修改 FPATH 等等依賴，就需要手動調整順序在 compinit 後載入

# shellenv MUST run before compinit
# put this in .zprofile if get something wrong in your completion
eval $(/opt/homebrew/bin/brew shellenv)

# Setup completion styles

# Set format for completion descriptions
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'

# Set prompt for interactive completion selection
zstyle ':completion:*' select-prompt '%F{green}%p%f'

# separate matches into groups, should be used with description format
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:match:*' original only

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Allow tab insertion when completion is pending
zstyle ':completion:*' insert-tab pending

# Not using cache
# zstyle ':completion:*' use-cache no

# fuzzy matching
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle -e ':completion:*:approximate:*' \
#   max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'


# Set format for completion warnings
zstyle ':completion:*:warnings' format '%F{red}-- No matches found --%f'

# Enable menu selection for completion
zstyle ':completion:*' menu select

# Set cache path for completion
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Set hjkl for completions
(( ${+modules[zsh/complist]} )) || zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom
  ZSHZ_DEBUG=1
  ZSHZ_CASE='smart'
  ZSHZ_ECHO=1
  # In FreeBSD, /home is /usr/home
  [[ $OSTYPE == freebsd* ]] && typeset -g ZSHZ_NO_RESOLVE_SYMLINKS=1
  # ZSHZ_TILDE=1
  ZSHZ_TRAILING_SLASH=1
  ZSHZ_UNCOMMON=1

# Uncomment if $BREW_PATH/share/zsh/site-functions missing in FPATH
# if type brew &>/dev/null
# then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# fi


# According to the zimfw documentation, we shouldn't run `compinit` again if `zmodule completion`  
# is used, And this is same as `zcomet compinit` However, removing these two lines would require 
# placing `eval $(/opt/homebrew/bin/brew shellenv)` before sourcing `zmodule completion`. 
# Additionally, `zmodule` enforces execution in non-blocking mode, significantly slowing down shell startup.  

# Currently, I don't use `<plugin-manager> compinit` and leverages `zsh-defer` to delay all initializations.
# If `<plugin-manager> compinit` is called, we can run compinit here again to trigger none-activated
# completions and doesn't require to move the `eval $(/opt/homebrew/bin/brew shellenv)`.

autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP"   # ZSH_COMPDUMP is configured in .zshenv


# Completions that require compdef must be loaded last

# uv (python)
eval "$(uv generate-shell-completion zsh)"
