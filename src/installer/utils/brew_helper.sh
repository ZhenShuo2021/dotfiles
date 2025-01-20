#!/usr/bin/env bash
create_askpass_script() {
    local temp_askpass
    local password
    
    read -s password
    
    temp_askpass=$(mktemp)
    printf '#!/bin/bash\n' > "$temp_askpass"
    printf "echo '%s'\n" "$password" >> "$temp_askpass"
    chmod +x "$temp_askpass"
    
    printf '%s\n' "$temp_askpass"
}

function brew_prefix() {
  local cpu_arch=$(uname -m)
  if [[ "Darwin" == "$(uname)" ]]; then
    case $cpu_arch in
      x86_64)
        echo "/usr/local"
      ;;
      arm64)
        echo "/opt/homebrew"
      ;;
      *)
        >&2 echo "Cannot determine brew prefix, unknown architecture $cpu_arch"
      ;;
    esac
  else
    echo "$HOME/.linuxbrew"
  fi
}

should_install_brew() {
  # Exit if installed
  if command -v brew &> /dev/null; then
    brew_path=$(brew --prefix)
    echo "Homebrew is already installed at $brew_path. Skipping installation."
    echo "$brew_path/bin" > /tmp/brew_path.txt
    return 1
  fi

  # Exit if INSTALL_HOMEBREW is set and not equals to 0
  # Continue if INSTALL_HOMEBREW is not set "or" equals to 1
  if [ -z "$INSTALL_HOMEBREW" ] || [ "$INSTALL_HOMEBREW" -eq 0 ]; then
    echo "Installing Homebrew"
  else
    echo "Homebrew installation aborted"
    return 1
  fi
}
