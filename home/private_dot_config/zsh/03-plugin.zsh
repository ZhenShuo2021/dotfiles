# Preload anything we need for the rest of the rc scripts
# =============================================================================

# Install OMZ and plugins
___docker_FILE="/Users/leo/.oh-my-zsh/custom/_docker"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
# git clone https://github.com/romkatv/zsh-defer  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-defer
# docker_comp="https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/zsh/_docker"
# if [ ! -f "$___docker_FILE" ]; then
#     curl -fsSL "$docker_comp" -o "$___docker_FILE"
# fi

# Enable the function of p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(zsh-defer zsh-autosuggestions zsh-completions zsh-syntax-highlighting zsh-z docker docker-compose extract git)
source $ZSH/oh-my-zsh.sh
source $ZZ/04-p10k.zsh
