#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
~/mambaforge/bin/python3.10 Main.py ONLINE_JUDGE 2> /dev/null

elif [[ $action == "check" ]]; then
  if [[ ! -e  ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  /home/runner/mambaforge/bin/python3.10 Main.py
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
