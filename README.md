# MACOS SETUP

macos-setup is a small project using Brewfile and ansible to bootstrap fresh macos install

## Usage

[install.sh](install.sh) is base script that installs all of the software and it's configuration: [Homebrew](https://brew.sh/) and [Ansible](https://www.ansible.com/)

### dotfiles

Dotfiles management by [chezmoi](https://www.chezmoi.io/) is supported. Dotfiles repository path and custom branch are passed as arguments to `install.sh` script.

### window management

This setup is using tiling window management via [aerospace](https://github.com/nikitabobko/AeroSpace).

### terminal

Custom automation script [terminal.sh](roles/terminal/files/terminal.sh) is used to open pop-up [kitty](https://sw.kovidgoyal.net/kitty/) terminal window using global ctrl+enter keyboard shortcut. When not in use, terminal window is hidden to a dedicated `Z` workspace.
