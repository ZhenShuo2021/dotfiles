# Preload anything we need for the rest of the rc scripts
# =============================================================================

# setup zimfw dir
ZIM_CONFIG_FILE=~/.config/zsh/zimrc
ZIM_HOME=~/.config/zsh/zim

# Enable the function of p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Install zimfw if not installed
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install p10k if not installed
if [[ ! -d ${ZIM_HOME}/modules/powerlevel10k ]]; then
  git clone --depth=10 https://github.com/romkatv/powerlevel10k ${ZIM_HOME}/modules/powerlevel10k
fi

# load zsh-defer and p10k
source ${ZIM_HOME}/modules/zsh-defer/zsh-defer.plugin.zsh
source ${ZIM_HOME}/modules/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/03-p10k.zsh ]] || source ~/.config/zsh/03-p10k.zsh

# load other plugins
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  zsh-defer source ${ZIM_HOME}/zimfw.zsh init -q
fi
zsh-defer source ${ZIM_HOME}/init.zsh


# Only search full prefix match
HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# disable 
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold,bg=cyan'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=white,bold,bg=red'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=2
zsh-defer unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
zsh-defer unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
