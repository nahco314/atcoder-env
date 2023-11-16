#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
wsc --dump Main.dump Main.ws

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.dump ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  wsc Main.ws
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
