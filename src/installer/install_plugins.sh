#!/bin/bash
set -e

PLUGIN_DIR="${PLUGIN_DIR:-$HOME/.local/share/zinit/plugins}"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone --depth=1 -q https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        echo -e "\033[33m \033[34mzinit installation successful.\033[0m" || \
        echo -e "\033[160m zinit clone has failed.\033[0m"
fi

# Manual install example for zinit.
# Respect zinit convention, source it in zshrc with "$HOME/.local/share/zinit/plugins/romkatv---zsh-defer"
# command git clone --depth=1 -q https://github.com/romkatv/zsh-defer $HOME/.local/share/zinit/plugins/romkatv---zsh-defer && \
#         echo -e "\033[33m \033[34mzsh-defer installation successful.\033[0m" || \
#         echo -e "\033[160m zsh-defer clone has failed.\033[0m"
