#!/usr/bin/env bash

if [ -n "$1" ]; then
  export DOTFILES_REPO="$1"
fi

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/opt/homebrew/bin/brew shellenv)"

# Install brew software
brew bundle

# Run ansible tasks
ansible-playbook playbook.yml
