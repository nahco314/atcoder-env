#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
koka -O2 -o a.out Main.kk 1>&2
if [ -f a.out ]; then chmod +x a.out; fi

elif [[ $action == "check" ]]; then
  if [[ ! -e a.out ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./a.out
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
