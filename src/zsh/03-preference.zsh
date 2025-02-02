# User Preferences
# ============================================================================
# 這裡個區域可以隨意更改

# 設定中文
export LANG=zh_TW.UTF-8
export LC_ALL=zh_TW.UTF-8

# 其餘靜態設定
export GPG_TTY=$(tty)   # 自動刷新 GPG 終端檢測
export LESS=FR   # git pager模式退出後清除文字
export PATH="$HOME/.local/bin:$PATH"   # 加入路徑
export PATH="$ZDOTFILES/src/bin:$PATH"   # 加入路徑
export ZSHZ_DATA="$XDG_CACHE_HOME/.z"   # 修改 zsh-z .z 位置
export LESSHISTFILE="$XDG_CACHE_HOME/.lesshst"   # 修改 .lesshst 位置
export HOMEBREW_NO_AUTO_UPDATE=1   # 關閉 homebrew 自動更新
export HOMEBREW_NO_ENV_HINTS=1   # 關閉提醒

export PROJECTS=~/Code  # your project folder that we can `c [tab]` to
export EDITOR='code'

# zsh history 設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
