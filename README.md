# MACOS SETUP

macos-setup is a small project using Brewfile and ansible to bootstrap fresh macos install

## Usage

[install.sh](install.sh) is base script that installs all of the software and it's configuration: [Homebrew](https://brew.sh/) and [Ansible](https://www.ansible.com/)

### dotfiles

Dotfiles management by [GNU stow](https://www.gnu.org/software/stow/) is supported. Dotfiles location is saved in [variables config](group_vars/all/all.yml) and it assumes it contains stow.txt file with a list of dotfiles with each file/folder on line. stow role performs stowing, comment it out of [playbook.yml](playbook.yml) to not use this feature.
