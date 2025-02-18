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

PLUGIN_DIR=/Users/leo/.oh-my-zsh/custom/plugins
source $PLUGIN_DIR/../themes/powerlevel10k/powerlevel10k.zsh-theme
source $ZZ/04-p10k.zsh
source $PLUGIN_DIR/zsh-defer/zsh-defer.plugin.zsh

zsh-defer source $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
zsh-defer source $PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh
zsh-defer source $PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
zsh-defer source $PLUGIN_DIR/zsh-z/zsh-z.plugin.zsh

zsh-defer source $___docker_FILE
zsh-defer source $PLUGIN_DIR/../../plugins/git/git.plugin.zsh
zsh-defer source $PLUGIN_DIR/../../plugins/extract/extract.plugin.zsh
zsh-defer source $PLUGIN_DIR/../../plugins/extract/extract.plugin.zsh
zsh-defer source $PLUGIN_DIR/../../lib/key-bindings.zsh
