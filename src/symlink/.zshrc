# Basic Settings
# ============================================================================
# 提前載入變數讓後續腳本都能使用

export ZDOTFILES=$HOME/.dotfiles   # shortcut to this dotfiles
source $ZDOTFILES/src/zsh/constant.zsh
source $PLUGIN_DIR/zsh-defer/zsh-defer.plugin.zsh   # 提前載入 zsh-defer 讓整個腳本都能使用


# User Preferences
# ============================================================================
# 這裡個區域可以隨意更改

# 設定中文
export LANG=zh_TW.UTF-8
export LC_ALL=zh_TW.UTF-8

# zsh history 設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 不需要花里胡哨的 ls，我们有更花里胡哨的 exa
# DISABLE_LS_COLORS=true
# alias ls=exa

# 其餘靜態設定
export GPG_TTY=$(tty)   # 自動刷新 GPG 終端檢測
export PATH="$HOME/.local/bin:$PATH"   # 加入路徑
export ZSHZ_DATA="$XDG_CACHE_HOME/.z"   # 修改 zsh-z .z 位置
export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"   # 修改 .lesshst 位置
export HOMEBREW_NO_AUTO_UPDATE=1   # 關閉 homebrew 自動更新
export HOMEBREW_NO_ENV_HINTS=1   # 關閉提醒


# Load dotfiles
# ============================================================================
# 載入這份 dotfiles 的設定如 theme, completion, system...

source $ZDOTFILES/src/zsh/load_all.zsh
