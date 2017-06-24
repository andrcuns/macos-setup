#!/usr/bin/env bash

if [ $# -gt 0 ]; then
  ansible-playbook playbook.yml --tags "$1" --ask-become-pass
else
  ansible-playbook playbook.yml --ask-become-pass
fi
