#!/bin/bash
set -e


run_packer() {
  rm -rf staging/*
	cp $1 staging/
	cp $2 staging/
	cp packer/variables.pkr.hcl staging/
  sudo packer build staging
} 

mkdir -p staging

if [ -z "$1" ]; then
  for source in packer/sources/*; do
    for build in packer/builds/*; do
      run_packer $source $build
    done
  done
else 
  if [ -z "$2" ]; then
    for build in packer/builds/*; do
      run_packer packer/sources/$1.pkr.hcl $build
    done
  else 
    run_packer packer/sources/$1.pkr.hcl packer/builds/$2.pkr.hcl
  fi
fi