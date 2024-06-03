#!/bin/bash

## create file if it doesnt already exists
createFile () {
  local file="$1"
  if [ ! -f "${file}" ]; then
    touch "${file}"
  fi
}

## Add heredoc to only empty files
setFileContent () {
  local file="$1"
  if [ ! -s "${file}" ]; then
    while read -r line; do
      var+="${line}" | tee -a "${file}"
    done
  fi
}
