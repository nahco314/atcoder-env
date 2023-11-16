#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
node --check Main.js && touch ok

elif [[ $action == "check" ]]; then
  if [[ ! -e ok ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  node --stack-size={memory:kb} Main.js ONLINE_JUDGE ATCODER
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
