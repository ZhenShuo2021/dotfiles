# Load plugins
# ============================================================================
# 載入插件的函式，預設啟用 zsh-defer，在載入後面加上 false 可以關閉該功能
# 由於 zsh-defer 遮蔽錯誤訊息，所以新增插件請先關閉延遲載入功能測試是否報錯需要額外依賴
# 
# Example:
#   load_plugin zsh-z             # load zsh-z with delay=0s
#   load_plugin zsh-z 0.5         # load zsh-z with delay=0.5s
#   load_plugin zsh-z 0 false     # load zsh-z without delay
#   load_plugin zsh-z         # load zsh-z without delay
#   load_plugin zsh-z 0 1         # load zsh-z without delay

load_omz_lib() {
  local lib_name=$1
  local delay=${2:-0}
  local use_defer=${3:-true}

  if [[ $# -eq 2 && "$2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    delay=$2
  fi

  if [[ $use_defer == true ]]; then
    zsh-defer -t $delay source "$OMZ_DIR/lib/$lib_name.zsh"
  else
    source "$OMZ_DIR/lib/$lib_name.zsh"
  fi
}

load_omz_plugin() {
  local plugin_name=$1
  local delay=${2:-0}
  local use_defer=${3:-true}

  if [[ $# -eq 2 && "$2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    delay=$2
  fi

  if [[ $use_defer == true ]]; then
    # echo $delay
    zsh-defer -t $delay source "$OMZ_DIR/plugins/$plugin_name/$plugin_name.plugin.zsh"
  else
    source "$OMZ_DIR/plugins/$plugin_name/$plugin_name.plugin.zsh"
  fi
}

load_plugin() {
  local plugin_name=$1
  local delay=${2:-0}
  local use_defer=${3:-true}

  if [[ $# -eq 2 && "$2" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    delay=$2
  fi

  if [[ "$use_defer" == true ]]; then
    zsh-defer -t $delay source "$PLUGIN_DIR/$plugin_name/$plugin_name.plugin.zsh"
  else
    source "$PLUGIN_DIR/$plugin_name/$plugin_name.plugin.zsh"
  fi
}
