# 
# Main script loads all zsh files for .zshrc
# 


# Some useful constants
# ============================================================================

export PROJECTS=~/Code  # your project folder that we can `c [tab]` to
export PATH="$ZDOTFILES/src/bin:$PATH"
export EDITOR='code'

FPATH="$ZDOTFILES/src/fpath:$FPATH"
zsh-defer autoload -U $ZDOTFILES/src/fpath/*(:t)


# Setup completions
# ============================================================================
# 請注意自動補全的載入順序必須是 FPATH > compinit > zstyle，如果插件需要
# compdef/compinit、修改 FPATH 等等依賴，就需要手動調整順序

autoload -U compinit
zsh-defer compinit -d "$ZSH_COMPDUMP"   # ZSH_COMPDUMP is configured in .zshenv


# Load plugins
# ============================================================================
# 直接在這裡改 omz 的主題和插件不用再去 omz 預設的超長設定檔找

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(colored-man-pages docker docker-compose extract git zsh-autosuggestions zsh-completions zsh-syntax-highlighting zsh-z)
bindkey ',' autosuggest-accept   # for zsh-autosuggestions
source $ZDOTFILES/src/zsh/plugins.zsh
source $ZSH/oh-my-zsh.sh


# Load dotfiles
# ============================================================================

# zsh-defer -t 0.5 source $ZDOTFILES/src/zsh/alias.zsh   # 更晚載入避免被插件的延遲載入覆蓋
zsh-defer source $ZDOTFILES/src/zsh/alias.zsh
zsh-defer source $ZDOTFILES/src/zsh/completion.zsh
source $ZDOTFILES/src/zsh/system.zsh
