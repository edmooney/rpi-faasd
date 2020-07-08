#!/bin/bash
set -e

if [[ $IMAGE_TYPE == *"raspios"* ]]; then
  rm /etc/apt/sources.list
  mv /etc/apt/sources.list_orig /etc/apt/sources.list
fi