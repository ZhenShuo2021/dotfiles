#!/bin/sh

# Install remotely from single shell command

echo "Installing Xcode Command Line Tools"
xcode-select --install

set -e # -e: exit on error

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

while true; do
  read -p "Are you using Git Bash? (y/n): " use_git_bash
  case "$use_git_bash" in
    y|Y)
      branch="git-bash"
      break
      ;;
    n|N)
      branch="main"
      break
      ;;
    *)
      echo "Invalid input. Please enter 'y' or 'n'."
      ;;
  esac
done

# exec: replace current process with chezmoi init
exec "$chezmoi" init https://github.com/ZhenShuo2021/dotfiles.git --branch "$branch" --apply --keep-going
