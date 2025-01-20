export PROJECTS=~/Code  # your project folder that we can `c [tab]` to
FPATH="$ZDOTFILES/src/fpath:$FPATH"
autoload -U $ZDOTFILES/src/fpath/*(:t)

# Duplicated: speedup autocomplete https://gist.github.com/ctechols/ca1035271ad134841284
# Have another thread refresh the cache in the background (subshell to hide output)
# zsh-defer fix everything
# autoload -Uz compinit; compinit -C
# (autoload -Uz compinit; compinit -d "${ZSH_COMPDUMP}" &)

# compinit 必須在 completion 之前載入
# see: https://homebrew.dev.org.tw/Shell-Completion
autoload -U compinit
compinit -d "$ZSH_COMPDUMP"   # Note: set in .zshenv

source $ZDOTFILES/src/zsh/alias.zsh
source $ZDOTFILES/src/zsh/completion.zsh
source $ZDOTFILES/src/zsh/system.zsh
