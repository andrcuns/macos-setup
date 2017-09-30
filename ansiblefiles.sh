#!/usr/bin/env bash

if [ $# -gt 0 ]; then
  ansible-playbook playbook.yml --tags "$1"
else
  ansible-playbook playbook.yml
fi
