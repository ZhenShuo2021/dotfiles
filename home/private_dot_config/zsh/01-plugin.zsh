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

# Install zsh-defer if not installed
if [[ ! -d ${ZIM_HOME}/modules/zsh-defer ]]; then
  git clone --depth=10 https://github.com/romkatv/zsh-defer.git ${ZIM_HOME}/modules/zsh-defer
fi

# Install docker completion
docker_completion="$HOME/.config/zsh/zim/modules/_docker"
if [ ! -f "$docker_completion" ]; then
  docker_comp="https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/zsh/_docker"
  curl -fsSL "$docker_comp" -o "$docker_completion"
  unset docker_comp
  unset docker_completion
fi

# load zsh-defer and p10k
source ${ZIM_HOME}/modules/zsh-defer/zsh-defer.plugin.zsh
source ${ZIM_HOME}/modules/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/03-p10k.zsh ]] || source ~/.config/zsh/03-p10k.zsh

# change zcompdump destination
# https://github.com/zimfw/zimfw/issues/343#issuecomment-584351654
zsh-defer zstyle -s ':zim:completion' dumpfile 'zdumpfile' || zdumpfile=$XDG_CACHE_HOME/zsh/zcompcache/.zcompdump
zsh-defer autoload -Uz zrecompile && zsh-defer zrecompile -p -q ${zdumpfile}
zsh-defer unset zdumpfile

# load other plugins
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  zsh-defer source ${ZIM_HOME}/zimfw.zsh init -q
fi

zsh-defer source ${ZIM_HOME}/init.zsh
zsh-defer source $docker_completion

# source again due to the bug in zimfw
source $ZIM_HOME/modules/ohmyzsh/lib/key-bindings.zsh
