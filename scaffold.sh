#!/bin/bash

export target_directory="$1"
export target_structure="$2"
export working_directory=$(pwd)

source helpers/directories.sh

## Create target directory if it doesnt exist
if [ ! -d "${target_directory}" ]; then
  createDirectory "${target_directory}"
  cd "${target_directory}"
fi

sh "${working_directory}/structures/common.sh" "${target_directory}"
sh "${working_directory}/structures/${target_structure}.sh" "${target_directory}"
