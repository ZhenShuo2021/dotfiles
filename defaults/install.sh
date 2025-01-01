#!/bin/sh
set -e

install_ohmyzsh() {
    # 安裝ohmyzsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # 安裝主題
    THEME_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    if [ ! -d "$THEME_DIR" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$THEME_DIR"
    fi

    # 安裝插件
    PLUGIN_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    if [ ! -d "$PLUGIN_DIR" ]; then
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_DIR"
    fi
    echo "Oh-My-ZSH installed successfully!"
}

# 設定 ZSH 預設值
ZSH=${ZSH:-$HOME/.oh-my-zsh}

if [ ! -d "$ZSH" ]; then
    install_ohmyzsh
else
    echo "Oh-my-zsh is already installed at $ZSH. Skipping installation."
fi

exit 0
