#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
s7c -O2 -oc3 Main.sd7 1>&2

elif [[ $action == "check" ]]; then
  if [[ ! -e Main ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./Main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
