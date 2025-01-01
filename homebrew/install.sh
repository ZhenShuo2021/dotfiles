#!/bin/sh
#
# Homebrew 安裝腳本
#

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

if ! command -v brew &> /dev/null
then
  echo "Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/tty 2>&1
  brew_path=$(brew_prefix)
  export PATH=$PATH:$brew_path/bin

  if ! command -v brew &> /dev/null
  then
    echo "Homebrew installation failed."
    exit 1
  else
    echo "Homebrew has been installed successfully at $brew_path"
    eval "$($brew_path/bin/brew shellenv)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    echo "$brew_path/bin" > /tmp/brew_path.txt
  fi
else
  brew_path=$(brew --prefix)
  echo "Homebrew is already installed at $brew_path. Skipping installation."
  echo "$brew_path/bin" > /tmp/brew_path.txt
fi
