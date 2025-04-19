# Preload anything we need for the rest of the rc scripts
# =============================================================================

# setup zimfw dir
ZIM_CONFIG_FILE=~/.config/zsh/zimrc
ZIM_HOME=~/.config/zsh/zim

# Install zimfw if not installed
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Install p10k if not installed
if [[ ! -d ${ZIM_HOME}/modules/powerlevel10k ]]; then
  git clone --depth=10 https://github.com/romkatv/powerlevel10k ${ZIM_HOME}/modules/powerlevel10k
fi

# Install zsh-defer if not installed
if [[ ! -d ${ZIM_HOME}/modules/zsh-defer ]]; then
  git clone --depth=10 https://github.com/romkatv/zsh-defer ${ZIM_HOME}/modules/zsh-defer
fi

# load zsh-defer and p10k
source ${ZIM_HOME}/modules/zsh-defer/zsh-defer.plugin.zsh
source ${ZIM_HOME}/modules/powerlevel10k/powerlevel10k.zsh-theme

# load other plugins
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  zsh-defer source ${ZIM_HOME}/zimfw.zsh init -q
fi
zsh-defer source ${ZIM_HOME}/init.zsh

# Substring search
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold,bg=cyan'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=white,bold,bg=red'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=2
# zsh-defer zmodload -F zsh/terminfo +p:terminfo
# for key ('^[[A' '^P' ${terminfo[kcuu1]}) zsh-defer bindkey ${key} history-substring-search-up
# for key ('^[[B' '^N' ${terminfo[kcud1]}) zsh-defer bindkey ${key} history-substring-search-down
# for key ('k') zsh-defer bindkey -M vicmd ${key} history-substring-search-up
# for key ('j') zsh-defer bindkey -M vicmd ${key} history-substring-search-down
# zsh-defer unset key

# Prefix search
HISTORY_SUBSTRING_SEARCH_PREFIXED=1
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
