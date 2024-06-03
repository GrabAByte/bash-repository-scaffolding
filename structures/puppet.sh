#!/bin/bash

target_directory="$1"
puppet_repository_type="$2"

## Set common files and directories
case "${puppet_repository_type}" in
  'control')
    directories=(hieradata/os
                 manifests
                 modules
                 profiles
                 roles
                 site
                 spec/classes/profile
                 spec/defines
                 spec/fixtures/hieraata
               )
    files=(.fixtures.yml
           .puppet-lint.rc
           .rubocop.yml
           environment.conf
           hiera.yml
           manifests/site.pp
           Puppetfile
      )
    ;;
  'module')
    directories=(data
                 examples
                 manifests
                 spec
                 spec/acceptance
                 spec/classes
                 spec/fixtures
                 templates
                 types)
    files=(.fixtures.yml
           .puppet-lint.rc
           .rspec
           .rubocop.yml
           .hiera.yml)
    ;;
esac

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
