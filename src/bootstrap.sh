#!/usr/bin/env bash
#
# bootstrap installs things.

cd "$(dirname "$0")"
export SRC_ROOT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

setup_gitconfig () {
  if ! [ -f symlink/.gitconfig.local ]
  then
    info 'setup gitconfig'

    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    user ' - What is your github author name?'
    read -e git_authorname
    user ' - What is your github author email?'
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" symlink/.gitconfig.local.example > symlink/.gitconfig.local

    success 'gitconfig'
  fi
}


link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

link_files () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find "$SRC_ROOT/symlink" -mindepth 1 -maxdepth 1 -not -name '.DS_Store' -not -name '*.example')
  do
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
  done
}


ask_for_sudo() {
  # Ask for the administrator password upfront.
  # https://github.com/alrra/dotfiles/blob/main/src/os/utils.sh

  if sudo -n true 2>/dev/null; then
    return
  else
    user "Password required for administrator privileges"
    echo
  fi

  sudo -v &> /dev/null

  # Update existing `sudo` time stamp
  # until this script has finished.
  #
  # https://gist.github.com/cowboy/3118588

  while true; do
      sudo -n true
      sleep 60
      kill -0 "$$" || exit
  done &> /dev/null &
}

ask_for_sudo
setup_gitconfig
link_files

printf "\n  All linked! Don't forget to restart your terminal.\n\n"

sleep 1

info "installing dependencies"
if source installer/main | while read -r data; do info "$data"; done
then
  success "dependencies installed"
else
  fail "error installing dependencies"
fi

printf '\n  All installed!\n'
