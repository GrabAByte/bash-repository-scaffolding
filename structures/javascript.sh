#!/bin/bash

target_directory="$1"

## Set common files and directories
directories=(lib
             src
             build
             dist
             bin
             test
             unit
             integration
             env
             doc
             examples)
files=(app.js
       package.json)

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
