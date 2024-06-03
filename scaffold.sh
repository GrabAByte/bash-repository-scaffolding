#!/bin/bash

working_directory=$(pwd)

## Gather passed flags
while getopts ":o:s:t:" opt; do
  case $opt in
    o)
      output_directory="$OPTARG"
      ;;
    s)
      structure_technology="$OPTARG"
      ;;
    t)
      # optional
      structure_type="$OPTARG"
      ;;
    *)
      echo "error: unknown argument"
      echo "usage: ./scaffold.sh -t role -o ~/my-new-repository -s docker"
      exit 1
      ;;
  esac
done

## source helpers
source helpers/directories.sh
source helpers/files.sh

## Create output directory if it doesnt exist
if [ ! -d "${output_directory}" ]; then
  createDirectory "${output_directory}"
  #cd "${output_directory}" || exit
fi

## Run Scripts
sh "${working_directory}/structures/common.sh" "${output_directory}"

if [ -z ${structure_type+x} ]; then
  sh "${working_directory}/structures/${structure_technology}.sh" "${output_directory}" "${structure_technology}"
else
  sh "${working_directory}/structures/${structure_technology}.sh" "${output_directory}" "${structure_technology}" "${structure_type}"
fi
