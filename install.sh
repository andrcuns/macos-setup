#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install ansible
brew install ansible

# Install command-line tools using Homebrew
bash scripts/brew.sh

# macos specific setup
bash scripts/macos.sh
