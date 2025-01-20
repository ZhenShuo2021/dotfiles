#!/bin/sh
#
# Homebrew 安裝腳本
#

source "$(dirname "$0")/utils/brew_helper.sh"

brew_bundle() {
  if [[ -f "$TEMP_ASKPASS_SCRIPT" ]]; then
    password=$(bash "$TEMP_ASKPASS_SCRIPT")
  else
    echo "Please enter your password for brew installations: "
    TEMP_ASKPASS_SCRIPT=$(create_askpass_script)
    password=$(bash "$TEMP_ASKPASS_SCRIPT")
  fi
  rm "$TEMP_ASKPASS_SCRIPT"
  unset TEMP_ASKPASS_SCRIPT
}

install_homebrew() {
  # early return
  if ! should_install_brew; then exit 0; fi
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/tty 2>&1
  brew_path=$(brew_prefix --prefix)

  "$brew_path/bin/brew" --version &> /dev/null
  if [ $? -ne 0 ]; then
    echo "Homebrew installation failed."
    exit 1
  fi

  printf "\033[00;32mHomebrew successfully installed at $brew_path\033[0m\n"
  eval "$($brew_path/bin/brew shellenv)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  echo "$brew_path/bin" > /tmp/brew_path.txt

  echo 'Start installing packages in Brewfile'
  brew_bundle
}

install_homebrew
