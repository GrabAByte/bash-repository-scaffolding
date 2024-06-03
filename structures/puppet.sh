#!/bin/bash

target_directory="$1"
puppet_repository_type="$2"

## Set common files and directories
case "${puppet_repository_type}" in
  'control')
    directories=()
    files=()
    ;;
  'module')
    directories=()
    files=()
    ;;
esac

source helpers/files.sh
source helpers/directories.sh

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
