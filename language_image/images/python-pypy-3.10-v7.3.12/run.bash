#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
pypy3 -m py_compile Main.py
pypy3 Main.py ONLINE_JUDGE 2> /dev/null

elif [[ $action == "check" ]]; then
  if [[ ! -e ./__pycache__/Main.pypy310.pyc ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  pypy3 Main.py
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
