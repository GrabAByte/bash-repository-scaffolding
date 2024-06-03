#!/bin/bash

target_directory="$1"
jenkins_repository_type="$2"

## Set common files and directories
case "${jenkins_repository_type}" in
  'seed')
    directories=(seed)
    files=(Jenkinsfile
           seed/scaffolding.groovy
           seed/jobs.groovy)
    ;;
  'pipeline')
    directories=(pipelines)
    files=(Jenkinsfile)
    ;;
  'library')
    directories=(resources
                 src
                 test
                 vars)
    files=()
    ;;
esac

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
