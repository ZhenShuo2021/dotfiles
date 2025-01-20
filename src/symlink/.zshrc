export ZDOTFILES=$HOME/.dotfiles   # shortcut to this dotfiles
if [[ -a ~/.localrc ]]; then source ~/.localrc; fi   # localrc 用以載入敏感設定

# User Preferences
# ============================================================================
# 這裡可以隨意更改

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
export PATH="/Users/leo/.local/bin:$PATH"   # 加入路徑
export ZSHZ_DATA="$HOME/.cache/.z"   # 修改 zsh-z .z 位置
export LESSHISTFILE="$HOME/.cache/.lesshst"   # 修改 .lesshst 位置
export HOMEBREW_NO_AUTO_UPDATE=1   # 關閉 homebrew 自動更新
export HOMEBREW_NO_ENV_HINTS=1   # 關閉提醒


# Load plugins
# ============================================================================
# 不使用插件管理器載入外部插件，插件應該都以 *.plugin.zsh 結尾

PLUGIN_DIR="$HOME/.local/share/zsh/plugins"
OMZ_DIR="$PLUGIN_DIR/ohmyzsh"
source $PLUGIN_DIR/zsh-defer/zsh-defer.plugin.zsh

zsh-defer source $OMZ_DIR/lib/key-bindings.zsh
zsh-defer source $OMZ_DIR/plugin/docker.zsh
zsh-defer source $OMZ_DIR/plugin/git.zsh
zsh-defer source $PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
zsh-defer source $PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
zsh-defer source $PLUGIN_DIR/zsh-z/zsh-z.plugin.zsh


# Load dotfiles
# ============================================================================
# 載入這份 dotfiles 的設定如 theme, completion, system...

export PATH="$ZDOTFILES/src/bin:$PATH"
export EDITOR='code'
zsh-defer source $ZDOTFILES/src/zsh/_load_zsh.zsh


# Load zsh theme
# ============================================================================
# 載入 zsh 主題，應該在最後並且不使用延遲載入

source $PLUGIN_DIR/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $ZDOTFILES/src/zsh/.p10k.zsh ]] || source $ZDOTFILES/src/zsh/.p10k.zsh
