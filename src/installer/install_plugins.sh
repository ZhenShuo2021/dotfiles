#!/bin/bash
set -e

# 預設安裝到 $HOME/.oh-my-zsh
OHMYZSH_DIR="${OHMYZSH_DIR:-$HOME/.oh-my-zsh}"
THEME_DIR="${THEME_DIR:-${OHMYZSH_DIR}/custom/themes}"
PLUGINS_DIR="${PLUGINS_DIR:-${OHMYZSH_DIR}/custom/plugins}"

install_ohmyzsh() {
    echo "Installing Oh-My-Zsh..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

    echo "Oh-My-Zsh installed successfully!"
    backup_zshrc
}

install_plugins() {
    mkdir -p "$PLUGINS_DIR" "$THEME_DIR"
    echo "Installing plugins and themes..."
    echo "Plugins directory: $PLUGINS_DIR"

    install_plugin "https://github.com/romkatv/powerlevel10k.git" "$THEME_DIR"/powerlevel10k
    install_plugin "https://github.com/zsh-users/zsh-autosuggestions" "${PLUGINS_DIR}/zsh-autosuggestions"
    install_plugin "https://github.com/zsh-users/zsh-completions" "${PLUGINS_DIR}/zsh-completions"
    install_plugin "https://github.com/zsh-users/zsh-history-substring-search" "${PLUGINS_DIR}/zsh-history-substring-search"
    install_plugin "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${PLUGINS_DIR}/zsh-syntax-highlighting"
    install_plugin "https://github.com/romkatv/zsh-defer" "${PLUGINS_DIR}/zsh-defer"
    install_plugin "https://github.com/agkozak/zsh-z" "${PLUGINS_DIR}/zsh-z"

    echo "Plugins and themes installed successfully!"
}

install_plugin() {
    local plugin_url="$1"
    local plugin_path="$2"
    local plugin_name=$(basename -s .git "$plugin_url")

    if [ ! -d "$plugin_path" ]; then
        git clone --depth=1 -q "$plugin_url" "$plugin_path"
        echo "$plugin_name successfully installed"
    else
        echo "$(basename "$plugin_path") is already installed."
    fi
}

backup_zshrc() {
    if [ -f "$HOME/.zshrc" ]; then
        sed '1i\
# Backup .zshrc as oh-my-zsh overwrites it' "$HOME/.zshrc" > "$HOME/.zshrc.new" && mv "$HOME/.zshrc.new" "$HOME/.zshrc"
        mv "$HOME/.zshrc" "$HOME/.zshrc.backup-omz"
        echo "Backup .zshrc to as oh-my-zsh overwrites it"
        echo "Note: the backed-up file should be the .zshrc of oh-my-zsh"
        echo "Note: oh-my-zsh back your file to .zshrc.pre-oh-my-zsh"
    fi
}

main() {
    if [ ! -d "$OHMYZSH_DIR" ]; then
        install_ohmyzsh
        install_plugins
    else
        echo "Oh-My-Zsh is already installed at $OHMYZSH_DIR. Skipping installation."
    fi
}

main
