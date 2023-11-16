#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
cd main && shards build --release --no-debug --no-color -Donline_judge 1>&2

elif [[ $action == "check" ]]; then
  if [[ ! -e main/bin/main ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./main/bin/main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
