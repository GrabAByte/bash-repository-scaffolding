# bash-repository-scaffolding

## Description

This project was created as an easy way to create industry best practice codebase structures, which act as boilerplates over a number of DevOps tooling and programming languages. This stops the need to fork boilerplate repositories themselves

## Dependencies

In order to run these scripts you simply need to be running the terminal on a Unix based operating system

## Usage

The parent script is housed at the root of the project, named scaffold.sh and takes in a maximum of 3 arguments current, which are -

```
-s    The target tooling or programming language, all aptions reside within ./structures
-o    The target output directory, this can be a vanilla local directory or an already initialized git repository directory`
-t    (optional) The structure type. This is applicable to tooling which has differing repository structures based on whether it is a module or control repository generally
```

An example command to use -

```
./scaffold.sh \
  -o ~/code/github/terraform-module-ec2 \
  -s terraform \
  -t module
```

This will create the output directory is it isnt already present, run the `./structures/terraform.sh` script and create terraform files and directories relate to module construction

Regardless of the structure type, the `./structures/common.sh` script will be ran, this contains generic files such as `README.md`, `CHANGELOG.md` and `LICENSE` which should be present in all respositories regardless of tool or programming language.

## Authors

This repository was created and is maintained by GrabAByte (Tom Richards)
