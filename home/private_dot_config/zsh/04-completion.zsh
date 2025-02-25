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

# Set format for completion warnings
zstyle ':completion:*:warnings' format '%F{red}-- No matches found --%f'

# Set prompt for interactive completion selection
zstyle ':completion:*' select-prompt '%F{green}%p%f'

# Separate matches into groups, should be used with description format
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:match:*' original only

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Allow tab insertion when completion is pending
zstyle ':completion:*' insert-tab pending

# Enable menu selection for completion
zstyle ':completion:*' menu select

# Set cache path for completion
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Misc
zstyle ':completion:*' list-separator ' ➤ '
# zstyle ':completion:*' list-dirs-first true
# zstyle ':completion:*' list-packed true
# zstyle ':completion:*' rehash true

# Not using cache
# zstyle ':completion:*' use-cache no

# fuzzy matching
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle -e ':completion:*:approximate:*' \
#   max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

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
compinit


# uv (python)
eval "$(uv generate-shell-completion zsh)"
