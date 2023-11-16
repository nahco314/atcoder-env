#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
python3.11 -m py_compile Main.py
python3.11 Main.py ONLINE_JUDGE 2> /dev/null

elif [[ $action == "check" ]]; then
  if [[ ! -e ./__pycache__/Main.cpython-311.pyc ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  python3.11 Main.py
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
