zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' menu select

# Uncomment if $BREW_PATH/share/zsh/site-functions missing in FPATH
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
