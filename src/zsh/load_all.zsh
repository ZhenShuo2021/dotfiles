# 
# Main script loads all zsh files for .zshrc
# 

# Initialize plugins
# ============================================================================
# 初始化套件

OMZ_DIR="$PLUGIN_DIR/ohmyzsh"
source $ZDOTFILES/src/zsh/plugins.zsh
zsh-defer source "$OMZ_DIR/oh-my-zsh.sh"   # OMZ cache and completions. Required by docker/git


# Load plugins
# ============================================================================
# 真正載入插件，插件應該都以 *.plugin.zsh 結尾，並且晚於 compinit 載入
# 所有函式預設啟用 zsh-defer，在載入後面加上 false 可以關閉該功能
# 由於 zsh-defer 遮蔽錯誤訊息，所以新增插件請先關閉延遲載入功能測試是否報錯需要額外依賴

load_omz_lib "git"
load_omz_lib "history"

autoload -Uz is-at-least   #  for docker plugin
load_omz_plugin "docker"
load_omz_plugin "docker-compose"
load_omz_plugin "extract"
load_omz_plugin "git"

load_plugin zsh-autosuggestions; bindkey ',' autosuggest-accept
load_plugin zsh-completions
load_plugin zsh-syntax-highlighting
load_plugin zsh-z

# colored manpage
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


# Conflict: use either `zsh-history-substring-search` or `key-bindings`. Also, I don't like substring search
load_omz_lib key-bindings
# load_plugin "zsh-history-substring-search"
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


# optional plugins
# load_plugin zsh-better-npm-completion


# deprecated plugins
# load_omz_lib completion   # brew fpath and zsh-completions are better


# Load dotfiles
# ============================================================================
# 載入這份 dotfiles 的設定如 theme, completion, system...

export PROJECTS=~/Code  # your project folder that we can `c [tab]` to
export PATH="$ZDOTFILES/src/bin:$PATH"
export EDITOR='code'

# 請注意自動補全的載入順序必須是 FPATH > compinit > zstyle
FPATH="$ZDOTFILES/src/fpath:$FPATH"
zsh-defer autoload -U $ZDOTFILES/src/fpath/*(:t)

zsh-defer autoload -U compinit
zsh-defer compinit -d "$ZSH_COMPDUMP"   # ZSH_COMPDUMP is configured in .zshenv

zsh-defer source $ZDOTFILES/src/zsh/alias.zsh   # 更晚載入避免被插件的延遲載入覆蓋
zsh-defer source $ZDOTFILES/src/zsh/completion.zsh
zsh-defer source $ZDOTFILES/src/zsh/system.zsh


# Load zsh theme
# ============================================================================
# 載入 zsh 主題，應該在最後載入並且不使用延遲載入

# p10k
# p10k configure 倒數第三個問題詢問是否啟用 instant prompt，選擇否
# p10k configure 最後一個問題詢問是否修改 .zshrc，選擇否
source $PLUGIN_DIR/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $ZDOTFILES/src/zsh/.p10k.zsh ]] || source $ZDOTFILES/src/zsh/.p10k.zsh

# pure
# fpath+=($PLUGIN_DIR/pure)
# autoload -U promptinit; promptinit
# prompt pure
