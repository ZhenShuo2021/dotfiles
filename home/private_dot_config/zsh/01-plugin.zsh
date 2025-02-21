# Preload anything we need for the rest of the rc scripts
# =============================================================================

# Enable the function of p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Install plugin manager and source it
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# load p10k
zcomet load romkatv/zsh-defer
zcomet load romkatv/powerlevel10k
source $ZZ/03-p10k.zsh

zsh-defer zcomet load ohmyzsh plugins/extract
zsh-defer zcomet load ohmyzsh plugins/git
zsh-defer zcomet load ohmyzsh lib key-bindings.zsh

zsh-defer zcomet load agkozak/zsh-z
zsh-defer zcomet load zsh-users/zsh-autosuggestions
zsh-defer zcomet load zsh-users/zsh-completions
zsh-defer zcomet load zsh-users/zsh-syntax-highlighting

# zsh-defer zcomet compinit

# optional plugins
# zcomet load lukechilds/zsh-better-npm-completion

# deprecated plugins
# zcomet load ohmyzsh lib completion.zsh   # brew fpath and zsh-completions are better
