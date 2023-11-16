#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
cnako3 -c Main.nako3

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.mjs ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  node --stack-size={memory:kb} Main.mjs
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
