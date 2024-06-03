#!/bin/bash

target_directory="$1"
ansible_repository_type="$3"

## Set common files and directories
case "${ansible_repository_type}" in
  'role')
    directories=(defaults
                 meta
                 handlers
                 molecule/default
                 tasks
                 vars)
    files=(.ansible-lint
            defaults/main.yml
            handlers/main.yml
            meta/main.yml
            molecule/default/converge.yml
            molecule/default/molecule.yml
            tasks/main.yml
            vars/main.yml
           .yamllint)
    ;;
  'playbook')
    directories=(host_vars
                 group_vars
                 roles)
    files=(hosts
           playbook.yml
           site.yml)
    ;;
esac

source helpers/directories.sh
source helpers/files.sh

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
