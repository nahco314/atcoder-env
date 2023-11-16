#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
bash -n Main.bash || rm Main.bash

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.bash ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  bash Main.bash
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
