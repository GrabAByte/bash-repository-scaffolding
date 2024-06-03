#!/bin/bash

target_directory="$1"

## Set common files and directories
directories=(.github/workflows docs)
files=(CHANGELOG.md
       LICENSE
       metadata.json
       OWNERS
       README.md
       .github/workflows/ci.yml
       .gitignore)

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
