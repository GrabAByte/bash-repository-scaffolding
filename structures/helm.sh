#!/bin/bash

target_directory="$1"

## Set common files and directories
directories=(charts
             examples
             test)
files=(lint.yaml
       examples/default_values.yaml)

source helpers/directories.sh
source helpers/files.sh

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
