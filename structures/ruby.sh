#!/bin/bash

target_directory="$1"

## Set common files and directories
directories=(lib
             rake
             docs
             rubocop
             script
             test
             test/fixtures)
files=(.jrubyrc
       .rubocop.yml
        Gemfile
        Rakefile)

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
