#!/bin/bash
set -e

# 預設安裝到 $HOME/.local/share/zsh/plugins
# 直接執行可以在指令前設定路徑，例如 PLUGIN_DIR="/path/to/dir"
PLUGIN_DIR="${PLUGIN_DIR:-$HOME/.local/share/zsh/plugins}"

install_plugins() {
    mkdir -p "$PLUGIN_DIR"
    echo "Start installing plugins"
    echo "Plugin directory: $PLUGIN_DIR"

    install_plugin "https://github.com/romkatv/powerlevel10k"
    install_plugin "https://github.com/ohmyzsh/ohmyzsh.git"
    install_plugin "https://github.com/zsh-users/zsh-autosuggestions"
    install_plugin "https://github.com/zsh-users/zsh-syntax-highlighting"
    install_plugin "https://github.com/agkozak/zsh-z.git"
    install_plugin "https://github.com/romkatv/zsh-defer.git"
}

install_plugin() {
    # clone插件，如果已經安裝則會顯示插件安裝位置
    # Example：
    #   install_plugin "https://github.com/zsh-users/zsh-autosuggestions"
    #   install_plugin "https://github.com/zsh-users/zsh-syntax-highlighting.git"

    local plugin_url="$1"
    local plugin_name=$(basename -s .git "$plugin_url")
    local plugin_path="$PLUGIN_DIR/$plugin_name"

    if [ ! -d "$plugin_path" ]; then
        git clone --depth=1 -q "$plugin_url" "$plugin_path"
        echo "$plugin_name successfully installed"
    else
        echo "$plugin_name is already installed"
    fi
}

install_plugins
