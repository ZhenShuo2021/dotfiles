# 設定常數在後續腳本使用
# ============================================================================

export ZDOTFILES=$HOME/.dotfiles   # 指向這份dotfiles，src/bin/dotfile-update需要和此處設定相同
ZDOTFILES_ZSH_DIR=$ZDOTFILES/src/zsh
PLUGIN_DIR="$HOME/.local/share/zinit/plugins"
if [[ -a $HOME/.localrc ]]; then source $HOME/.localrc; fi   # 載入用來儲存敏感資訊的 localrc
