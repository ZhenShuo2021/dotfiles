# Preload anything we need for the rest of the rc scripts
# =============================================================================

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
PLUGIN_DIR="${ZSH_CUSTOM}/plugins"
mkdir -p "$PLUGIN_DIR"

# Install and compile plugins, comment these lines while testing
# https://github.com/romkatv/zsh-bench/blob/master/configs/diy%2B%2B/skel/.zshrc

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh
function zcompile-many() {
  local f
  for f; do 
    zcompile -R -- "$f".zwc "$f"
  done
}

declare -A plugins=(
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
  [zsh-completions]="https://github.com/zsh-users/zsh-completions"
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting"
  [zsh-history-substring-search]="https://github.com/zsh-users/zsh-history-substring-search"
  [zsh-z]="https://github.com/agkozak/zsh-z"
  [zsh-defer]="https://github.com/romkatv/zsh-defer"
)

for plugin repo in "${(@kv)plugins}"; do
  target_dir="${PLUGIN_DIR}/${plugin}"
  if [[ ! -e "$target_dir" ]]; then
    git clone --depth=1 "$repo" "$target_dir"
  fi
  if [[ -d "$target_dir" ]]; then
    zcompile-many "$target_dir"/*.zsh
    if [[ "$plugin" = "zsh-syntax-highlighting" && -d "$target_dir/highlighters" ]]; then
      zcompile-many "$target_dir/highlighters"/*/*.zsh
    fi
  fi
done

# End of Install and compile plugins


# Enable the function of p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $PLUGIN_DIR/../themes/powerlevel10k/powerlevel10k.zsh-theme
source $ZZ/03-p10k.zsh
source $PLUGIN_DIR/zsh-defer/zsh-defer.plugin.zsh

zsh-defer source $PLUGIN_DIR/../../plugins/extract/extract.plugin.zsh
zsh-defer source $PLUGIN_DIR/../../plugins/git/git.plugin.zsh


# configure zsh-history-substring-search
zsh-defer source $PLUGIN_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh

# Only search full prefix match
HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# disable 
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold,bg=cyan'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=white,bold,bg=red'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=2
zsh-defer unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND
zsh-defer unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


zsh-defer source $PLUGIN_DIR/zsh-z/zsh-z.plugin.zsh
zsh-defer source $PLUGIN_DIR/zsh-completions/zsh-completions.plugin.zsh
zsh-defer source $PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
zsh-defer source $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
