#!/bin/bash

target_directory="$1"

## Set common files and directories
directories=(docker)
files=(.hadolint.yml
       docker/Dockerfile)

source helpers/files.sh
source helpers/directories.sh

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
