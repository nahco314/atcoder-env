#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
zsh -n Main.zsh || rm Main.zsh

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.zsh ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  zsh Main.zsh
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
