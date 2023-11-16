#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  


elif [[ $action == "check" ]]; then
  if [[ ! -e  ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  bf -c999999999 Main.bf
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi