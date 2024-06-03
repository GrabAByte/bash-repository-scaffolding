#!/bin/bash

## create directory and subdirectories if they dont already exists
createDirectory () {
  local directory="$1"
  if [ ! -d "${directory}" ]; then
    mkdir -p "${directory}"
  fi
}
