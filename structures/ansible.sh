#!/bin/bash

target_directory="$1"
ansible_repository_type="$2"

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
  'platbook')
    directories=(host_vars
                 group_vars
                 roles)
    files=(hosts
           playbook.yml
           site.yml)
    ;;
esac

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
