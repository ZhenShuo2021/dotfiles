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

# Load lazy-loading function to make it usable everywhere
zcomet load romkatv/powerlevel10k
source $ZZ/04-p10k.zsh

zcomet load romkatv/zsh-defer

docker_comp="https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/zsh/_docker"
zsh-defer zcomet snippet $docker_comp
# zsh-defer zcomet load ohmyzsh plugins/docker-compose
zsh-defer zcomet load ohmyzsh plugins/extract
zsh-defer zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh lib key-bindings.zsh

zsh-defer zcomet load zsh-users/zsh-autosuggestions
zsh-defer zcomet load zsh-users/zsh-completions
zsh-defer zcomet load zsh-users/zsh-syntax-highlighting
zsh-defer zcomet load agkozak/zsh-z

# optional plugins
# zsh-defer zcomet load lukechilds/zsh-better-npm-completion

# deprecated plugins
# zsh-defer zcomet load ohmyzsh lib completion.zsh   # brew fpath and zsh-completions are better
