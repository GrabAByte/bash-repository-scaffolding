#!/bin/bash

working_directory=$(pwd)

while getopts ":t:s" opt; do
  case $opt in
    t)
      target_directory="$OPTARG";;
    s)
      target_structure="$OPTARG";;
  esac
done

source helpers/directories.sh

## Create target directory if it doesnt exist
if [ ! -d "${target_directory}" ]; then
  createDirectory "${target_directory}"
  cd "${target_directory}"
fi

sh "${working_directory}/structures/common.sh" "${target_directory}"
sh "${working_directory}/structures/${target_structure}.sh" "${target_directory}"
