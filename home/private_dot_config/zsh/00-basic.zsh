# Define constants for use in subsequent scripts
# =============================================================================
# Paths pointing to source dotfiles (used for fpath/bin/git aliases)

CM_ZSH_DIR=$HOME/.local/share/chezmoi/home/private_dot_config/zsh
CM_ZSH_PREFERENCE=$CM_ZSH_DIR/02-preference.zsh
CM_ZSH_ALIAS=$CM_ZSH_DIR/99-alias.zsh

# Paths pointing to destination files
# Edit these files and use `chezmoi add` to update the original git repository (CM_ZSH_DIR)
ZZ=$HOME/.config/zsh
ZZ_PREFERENCE=$ZZ/02-preference.zsh
ZZ_ALIAS=$ZZ/99-alias.zsh
