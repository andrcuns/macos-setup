#!/usr/bin/env bash

# Install xcode cli tools
sudo xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew software
brew bundle

# Run ansible tasks
ansible-playbook playbook.yml
