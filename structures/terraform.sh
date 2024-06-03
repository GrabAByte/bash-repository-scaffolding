#!/bin/bash

target_directory="$1"
terraform_repository_type="$2"

## Set common files and directories
case "${terraform_repository_type}" in
  'managed')
    directories=()
    files=()
    ;;
  'module')
    directories=()
    files=()
    ;;
esac

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
