#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
sage --preparse Main.sage && python3 -m py_compile Main.sage.py || rm Main.sage.py

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.sage.py ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  python3 Main.sage.py
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
