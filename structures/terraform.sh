#!/bin/bash

target_directory="$1"
terraform_repository_type="$3"

## Set common files and directories
case "${terraform_repository_type}" in
  'managed')
    directories=(environments
                 environments/development
                 environments/staging
                 environments/pre-production
                 environments/production)
    files=(.tflint.hcl
           environments/development/{providers.tf,variables.tf,versions.tf,outputs.tf,terraform.tfvars}
           environments/staging/{providers.tf,variables.tf,versions.tf,outputs.tf,terraform.tfvars}
           environments/pre-production/{providers.tf,variables.tf,versions.tf,outputs.tfterraform.tfvars}
           environments/production/{providers.tf,variables.tf,versions.tf,outputs.tf,terraform.tfvars})
    ;;
  'module')
    directories=(test)
    files=(.tflint.hcl
           locals.tf
           main.tf
           outputs.tf
           providers.tf
           variables.tf
           versions.tf)
    ;;
  *)
    echo "error: terraform type not provided"
    exit 2
esac

source helpers/directories.sh
source helpers/files.sh

for directory in "${directories[@]}"; do
  createDirectory "${target_directory}/${directory}"
done

for file in "${files[@]}"; do
  createFile "${target_directory}/${file}"
done
