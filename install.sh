#!/usr/bin/env bash

function log() {
  echo -e "\033[1;35m$1\033[0m"
}

function success() {
  echo -e "\033[1;32m$1\033[0m"
}

if [ -n "$1" ]; then
  dotfiles_repo="$1"
  dotfiles_branch="$2"
fi

log "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/opt/homebrew/bin/brew shellenv)"
success "done!"

log "Installing dependencies from Brewfile..."
brew bundle
success "done!"

log "Running Ansible playbook..."
ansible-playbook playbook.yml

if [ -n "$dotfiles_repo" ]; then
  echo ""
  log "*** Initializing chezmoi with repo: $dotfiles_repo ***"
  echo ""
  chezmoi init "$dotfiles_repo" --apply ${dotfiles_branch:+--branch "$dotfiles_branch"}
  success "done!"
fi
