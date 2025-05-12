# MACOS SETUP

macos-setup is a small project using Brewfile and ansible to bootstrap fresh macos install

## Usage

[install.sh](install.sh) is base script that installs all of the software and it's configuration: [Homebrew](https://brew.sh/) and [Ansible](https://www.ansible.com/)

### dotfiles

Dotfiles management by [chezmoi](https://www.chezmoi.io/) is supported. Dotfiles repository path is set via `DOTFILES_REPO` environment variable. It can also be passed as an argument to `install.sh` script.
