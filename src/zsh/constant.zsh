# Constant that can be shared by other scripts
PLUGIN_DIR="$HOME/.local/share/zsh/plugins"   # 設定插件路徑，和 installer/install_plugins.sh 相同
if [[ -a $HOME/.localrc ]]; then source $HOME/.localrc; fi   # 載入用來儲存敏感資訊的 localrc
