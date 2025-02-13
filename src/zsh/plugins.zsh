# Load plugins
# ============================================================================

load_omz_lib() {
  local lib_name=$1
  local delay=${2:-0}
  source "$OMZ_DIR/lib/$lib_name.zsh"
}

load_omz_plugin() {
  local plugin_name=$1
  local delay=${2:-0}
  source "$OMZ_DIR/plugins/$plugin_name/$plugin_name.plugin.zsh"
}

load_plugin() {
  local plugin_name=$1
  local delay=${2:-0}
  source "$PLUGIN_DIR/$plugin_name/$plugin_name.plugin.zsh"
}
