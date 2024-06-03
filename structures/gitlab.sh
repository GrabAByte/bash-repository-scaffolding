#!/bin/bash

target_directory="$1"

## Set common files and directories
directories=(jobs/common
             workflows)
files=(.yamllint)

source helpers/directories.sh
source helpers/files.sh

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
